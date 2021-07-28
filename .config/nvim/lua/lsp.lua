-- .config/nvim/lua/lsp.lua, neovim lsp config
-- source: https://github.com/pricheal/dotfiles

local custom_lsp_attach = function(client, bufnr)

    -- key binds
    vim.api.nvim_set_keymap("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "<leader>gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "<leader>pr", "<cmd>lua vim.lsp.buf.references()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "<leader>ps", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "<leader>s", "<cmd>lua vim.lsp.buf.hover()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "<leader>d", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", {noremap = true, silent = true})

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

    -----------------------------
    -- completion (nvim-compe)
    -----------------------------

    -- required
    vim.o.completeopt = "menuone,noselect"

    -- enable nvim-compe sources
    require'compe'.setup {
      source = {
          path = true;
          buffer = true;
          calc = true;
          nvim_lsp = true;
          nvim_lua = true;
          vsnip = true;
          ultisnips = true;
          luasnip = true;
      };
    }

    -- set completion documentation background color to match
    vim.api.nvim_command("highlight link CompeDocumentation NormalFloat")

    -- map enter to completion confirm
    vim.api.nvim_command("inoremap <silent><expr> <CR> compe#confirm('<CR>')")

end

-- language servers
require('lspconfig').tsserver.setup{
    on_attach = custom_lsp_attach;
    root_dir = require'lspconfig/util'.root_pattern(".git");
}
require('lspconfig').intelephense.setup{
    on_attach = custom_lsp_attach;
    root_dir = require 'lspconfig/util'.root_pattern(".git");
    settings = {
        intelephense = {
            files = {
                exclude = {"**/vendor/**/fitdegree/**"};
            },
            completion = {
                insertUseDeclaration = false;
            }
        }
    }
}
require('lspconfig').bashls.setup{on_attach = custom_lsp_attach}
require('lspconfig').pyright.setup{on_attach = custom_lsp_attach}

