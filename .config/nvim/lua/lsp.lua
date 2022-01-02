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

end

-----------------------------
-- nvim-cmp stuff
-----------------------------

local cmp = require'cmp'

vim.o.completeopt = "menu,menuone,noselect"

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      --vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    --{ name = 'vsnip' }, -- For vsnip users.
    { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-----------------------------
-- language servers
-----------------------------

require('lspconfig').tsserver.setup{
    on_attach = custom_lsp_attach;
    capabilities = capabilities;
    root_dir = require'lspconfig/util'.root_pattern(".git");
}
require('lspconfig').intelephense.setup{
    on_attach = custom_lsp_attach;
    capabilities = capabilities;
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
require('lspconfig').bashls.setup{
    on_attach = custom_lsp_attach;
    capabilities = capabilities;
}
require('lspconfig').pyright.setup{
    on_attach = custom_lsp_attach;
    capabilities = capabilities;
}
--require('lspconfig').tailwindcss.setup{
--    on_attach = custom_lsp_attach;
--    capabilities = capabilities;
--}

