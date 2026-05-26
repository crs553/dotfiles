return {
  content = function(args)
    local lines = vim.api.nvim_buf_get_lines(args.context.bufnr, 0, -1, false)
    return table.concat(lines, "\n")
  end,
}
