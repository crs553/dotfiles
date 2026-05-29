local function detect_base_branch()
  local result = vim.system({ "git", "symbolic-ref", "refs/remotes/origin/HEAD" }, { text = true }):wait()
  if result.stdout and result.stdout ~= "" then
    return result.stdout:gsub("refs/remotes/origin/", ""):gsub("%s+", "")
  end
  for _, name in ipairs({ "main", "master", "develop" }) do
    local r = vim.system({ "git", "rev-parse", "--verify", "origin/" .. name }, { text = true }):wait()
    if r.exit_code == 0 then
      return name
    end
  end
  return "main"
end

return {
  base_branch = function()
    return detect_base_branch()
  end,
  diff = function()
    local base = detect_base_branch()
    local result = vim.system({ "git", "diff", base .. "...HEAD" }, { text = true }):wait()
    return result.stdout or ""
  end,
  log = function()
    local base = detect_base_branch()
    local result = vim.system({ "git", "log", base .. "...HEAD", "--oneline" }, { text = true }):wait()
    return result.stdout or ""
  end,
}
