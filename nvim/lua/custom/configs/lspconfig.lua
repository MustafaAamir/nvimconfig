local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities
local util = require "lspconfig/util"
local lspconfig = require("lspconfig")


lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"},
})
lspconfig.clangd.setup {
  on_attach = function(client, bufner)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufner)
  end,
  capabilities = capabilities,
}

lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"rust"},
  root_dir = util.root_pattern("Cargo.toml"),
  settings = {
    ["rust_analyzer"] = {
      cargo = {
        allFeatures = true,
      },
    },
  },
})
