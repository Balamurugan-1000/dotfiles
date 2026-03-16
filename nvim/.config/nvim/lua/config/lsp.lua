local lspconfig = require("lspconfig")

lspconfig.sourcekit.setup({
  cmd = { "sourcekit-lsp" },
})
