vim.pack.add{
	{ src = 'https://github.com/neovim/nvim-lspconfig' },
	{ src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
}
vim.cmd.colorscheme "catppuccin-mocha"

-- LSP
vim.lsp.config("marksman", {
  cmd = { "marksman", "server" },
  filetypes = { "markdown", "md" },
  root_markers = { ".git" },
  single_file_support = true,
})

vim.lsp.config("lua_ls", {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { ".luarc.json", ".git" },
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      format = {
        enable = true,
        defaultConfig = {
          indent_style = "space",
          indent_size = "2",
        }
      },
      diagnostics = {
        globals = { "vim" },
      },
      signatureHelp = { enabled = true },
      telemetry = { enable = false },
      workspace = {
        library = vim.tbl_extend(
          "keep",
          { vim.env.VIMRUNTIME, "${3rd}/luv/library" },
          vim.api.nvim_get_runtime_file("", true)
        ),
      },
    },
  },
})

vim.lsp.config("yamlls", {
  cmd = { "yaml-language-server", "--stdio" },
  filetypes = { "yaml" },
  root_markers = { ".git" },
  settings = {
    yaml = {
      schemas = {
        -- Ansible
        ["https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/ansible.json#/$defs/tasks"] =
        "tasks/*.{yml,yaml}",
        ["https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/ansible.json#/$defs/playbook"] =
        "*{play,site}*.{yml,yaml}",
        -- Docker/Podman
        ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = {
          "*docker-compose*.{yml,yaml}",
          "*podman-compose*.{yml,yaml}",
        },
        -- Kubernetes
        kubernetes = {
          "*.{deployment,configmaps,secrets}.{yml,yaml}",
          "*.manifest.{yml,yaml}",
        },
        ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
        ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
        -- Github
        ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
        ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
        ["https://json.schemastore.org/dependabot-2.0"] = ".github/dependabot.{yml,yaml}",
      },
    },
  },
})

vim.lsp.enable("marksman")
vim.lsp.enable("lua_ls")
vim.lsp.enable("yamlls")
