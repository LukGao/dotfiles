local M = {}

local function create_capabilities( ... )
    local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
      capabilities.offsetEncoding = { "utf-16" }
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      capabilities.textDocument.completion.completionItem.resolveSupport = {properties = {'documentation', 'detail', 'additionalTextEdits'}
    }
    return capabilities
end

function M.setup()
  local nvim_lsp = require("lspconfig")

  nvim_lsp.clangd.setup {
    filetypes = { "cpp" ,"c"},
    cmd = {
      "clangd",
      "--background-index",
      "--completion-style=detailed",
      "--suggest-missing-includes",
      "--clang-tidy",
    }
  }
  local lsp_installer = require("nvim-lsp-installer")
    lsp_installer.on_server_ready(function(server)
    
    server:setup({
      capabilities = create_capabilities(),
      on_attach = function ( client, bufnr )

        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
        buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
        local opts = { noremap=true, silent=true }
        buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        buf_set_keymap('n', 'ft', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
        buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        buf_set_keymap('n', 'rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
        buf_set_keymap('n', 'ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)

        if client.resolved_capabilities.document_highlight then
          vim.api.nvim_exec([[
            augroup lsp_document_highlight
            autocmd! * <buffer>
            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
          ]], false)
        end
      end
    })
    
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      underline = false,
      signs = false,
      virtual_text = { 
        spacing = 4,
        prefix = "»"
      }
    })
    
    vim.cmd [[ do User LspAttachBuffers ]]
  end)
end

return M
