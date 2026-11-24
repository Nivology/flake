if vim.fn.executable("zizmor") ~= 1 then
  return {}
end

---@type vim.lsp.Config
return {
  cmd = { "zizmor", "--lsp" },
  filetypes = { "yaml" },
  root_dir = function(bufnr, on_dir)
    local bufname = vim.api.nvim_buf_get_name(bufnr)
    local parent = vim.fs.dirname(bufname)
    if
      vim.endswith(parent, "/.github/workflows")
      or vim.endswith(bufname, "/.github/dependabot.yml")
      or vim.endswith(bufname, "action.yml")
    then
      local root = vim.fs.root(bufnr, {
        ".github/zizmor.yml",
        "zizmor.yml",
        ".github/",
        ".git",
      })
      on_dir(root or parent)
    end
  end,
  init_options = {},
}
