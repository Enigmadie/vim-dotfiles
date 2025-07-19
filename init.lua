-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.timeoutlen = 125

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.name == "vtsls" then
      client.stop()
    end
  end,
})
