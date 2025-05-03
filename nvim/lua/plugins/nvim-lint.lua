return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPost", "BufWritePost", "InsertLeave" },
  config = function()
    require("lint").linters_by_ft = {
      --python = { "flake8" },
      --lua = { "luacheck" },
      --javascript = { "eslint" },
      --typescript = { "eslint" },
      markdown = { "markdownlint" },
      --sh = { "shellcheck" },
    }

    -- Auto-run linting on specific events
    vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}
