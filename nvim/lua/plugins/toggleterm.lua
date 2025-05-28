return {
  {
    'akinsho/toggleterm.nvim',
    tag = "v2.13.1",
    opts = {
      --[[ things you want to change go here]]
      size = 90,
      open_mapping = [[<M-i>]],
      direction = 'vertical'
    },
    config = function(_, opts)
      require("toggleterm").setup(opts)

      vim.keymap.set("n", "<M-i>", vim.cmd.ToggleTerm)
      vim.keymap.set("t", "<M-i>", vim.cmd.ToggleTerm)
    end,

  }
}
