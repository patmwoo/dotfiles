-- .config/nvim/lua/lsp.lua, neovim lsp config
-- source: https://github.com/katmfoo/dotfiles

local opts = { noremap=true, silent=true }
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

local on_attach = function(client, bufnr)

    -- key binds
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "<leader>pr", vim.lsp.buf.references, bufopts)
    vim.keymap.set("n", "<leader>s", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, bufopts)

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
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
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
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-----------------------------
-- language servers
-----------------------------

require('lspconfig').tsserver.setup{
    on_attach = on_attach;
    capabilities = capabilities;
}
require('lspconfig').intelephense.setup{
    on_attach = on_attach;
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
    on_attach = on_attach;
    capabilities = capabilities;
}
require('lspconfig').pyright.setup{
    on_attach = on_attach;
    capabilities = capabilities;
}
--require('lspconfig').tailwindcss.setup{
--    on_attach = on_attach;
--    capabilities = capabilities;
--}

