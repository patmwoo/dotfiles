local lspconfig = require('lspconfig')
local completion = require('completion')

local on_attach = function(client, bufnr)

  completion.on_attach(client, bufnr)

  vim.fn.nvim_set_keymap("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "<leader>gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "<leader>pr", "<cmd>lua vim.lsp.buf.references()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "<leader>ps", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "<leader>s", "<cmd>lua vim.lsp.buf.hover()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "<leader>d", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", {noremap = true, silent = true})

  -- make holding cursor on symbol highlight other references
  vim.api.nvim_command("set updatetime=300")
  vim.api.nvim_command("highlight link LspReferenceRead CursorColumn")
  vim.api.nvim_command("autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()")
  vim.api.nvim_command("autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()")
  vim.api.nvim_command("autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()")
  vim.api.nvim_command("autocmd CursorMovedI <buffer> lua vim.lsp.buf.clear_references()")

  -- diagnostics stuff (disable signs and virtual text)
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = false,
      signs = false
    }
  )

  -- completion stuff
  vim.api.nvim_command("set completeopt=menuone,noinsert,noselect")
  vim.api.nvim_command("let g:completion_chain_complete_list = [{'complete_items': ['lsp']}, {'complete_items': ['buffers']}]")
  vim.api.nvim_command("imap <c-j> <Plug>(completion_next_source)")
  vim.api.nvim_command("imap <c-k> <Plug>(completion_prev_source)")

end

lspconfig.tsserver.setup{
  on_attach = on_attach
}

