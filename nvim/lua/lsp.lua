-- YAML
vim.lsp.config('yamlls', {
  cmd = { 'yaml-language-server', '--stdio' },
  filetypes = { 'yaml' },
  settings = {
    yaml = {
      schemaStore = {
        enable = true,
        url = "https://www.schemastore.org/api/json/catalog.json",
      },
    },
  },
})
vim.lsp.enable('yamlls')

-- Markdown
vim.lsp.config('marksman', {
  cmd = { 'marksman', 'server' },
  filetypes = { 'markdown' },
})
vim.lsp.enable('marksman')
