return {
  {
    'williamboman/mason.nvim',
    tag = "v2.0.0-rc.2",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    }
  },
  {
    'williamboman/mason-lspconfig.nvim',
    tag = "v2.0.0-rc.1",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = { "pylsp", "marksman", "bashls", "lua_ls", "rust_analyzer", "nix", "harper_ls" },
      automatic_installation = true,
    }
  },
  {
    "neovim/nvim-lspconfig",
    tag = "v2.1.0",
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on Lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      -- auto-completion
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      local lspconfig = require("lspconfig")

      -- grammar checker
      lspconfig.harper_ls.setup({
        capabilites = capabilities,
        dialect = 'British'
      })

      -- Lua
      lspconfig.lua_ls.setup({ capabilites = capabilities })

      -- python
      lspconfig.pylsp.setup({
        capabilites = capabilities,
        plugins = {
          black = { enabled = true },
          pyflakes = { enabled = false },
          pycodestyle = { enabled = false },
        }
      })

      -- nixd
      lspconfig.nixd.setup({ capabilites = capabilities })

      -- markdown
      lspconfig.marksman.setup({ capabilities = capabilities })

      -- bash
      lspconfig.bashls.setup({ capabilities = capabilities })

      -- go lsp
      lspconfig.gopls.setup({ capabilities = capabilities })

      -- rust
      lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
        settings = {
          ['rust-analyzer'] = {
            cargo = { allFeatures = true },
            checkOnSave = {
              enable = true,
              command = "clippy",
            }
          },
        },

      })

      -- Global LSP settings: format on save + keymaps
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end

          local bufnr = args.buf

          -- Format on save
          if client.server_capabilities.documentFormattingProvider then
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({ bufnr = bufnr, async = false })
              end,
            })
          end

          -- LSP keymaps
          local opts = { noremap = true, silent = true, buffer = bufnr }
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', '[d', function()
            vim.diagnostic.jump({ direction = -1 })
          end, opts)

          vim.keymap.set('n', ']d', function()
            vim.diagnostic.jump({ direction = 1 })
          end, opts)
        end,
      })
    end,
  },
  {
    "mfussenegger/nvim-lint",
    event = {
      "BufReadPre",
      "BufNewFile",
    },
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        python = { "pylint" },
      }
      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "black" },
      },
    },
  },
}
