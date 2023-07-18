vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.updatetime = 300
local keyset = vim.keymap.set

function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

keyset("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
keyset("i", "<c-space>", "coc#refresh()", { silent = true, expr = true })

keyset("n", "[g", "<Plug>(coc-diagnostic-prev)", { silent = true })
keyset("n", "]g", "<Plug>(coc-diagnostic-next)", { silent = true })

-- GoTo code navigation
keyset("n", "gd", "<Plug>(coc-definition)", { silent = true })
keyset("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
keyset("n", "gi", "<Plug>(coc-implementation)", { silent = true })
keyset("n", "gr", "<Plug>(coc-references)", { silent = true })

-- Use K to show documentation in preview window
function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end

keyset("n", "K", '<CMD>lua _G.show_docs()<CR>', { silent = true })

-- Highlight the symbol and its references on a CursorHold event(cursor is idle)
vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
    group = "CocGroup",
    command = "silent call CocActionAsync('highlight')",
    desc = "Highlight symbol under cursor on CursorHold"
})


-- Update signature help on jump placeholder
vim.api.nvim_create_autocmd("User", {
    group = "CocGroup",
    pattern = "CocJumpPlaceholder",
    command = "call CocActionAsync('showSignatureHelp')",
    desc = "Update signature help on jump placeholder"
})

opts = { silent = true, nowait = true }

keyset("n", "<space>o", ":CocOutline<CR>", opts)
keyset("n", "<leader>rn", "<Plug>(coc-rename)", opts)
keyset("n", "<localleader>ft", "<Plug>(coc-format)", opts)

keyset("x", "<leader>a", "<Plug>(coc-codeaction-selected)", opts)
keyset("n", "<leader>a", "<Plug>(coc-codeaction-selected)", opts)

-- Remap keys for apply code actions at the cursor position.
keyset("n", "<leader>ac", "<Plug>(coc-codeaction-cursor)", opts)
-- Remap keys for apply code actions affect whole buffer.
keyset("n", "<leader>as", "<Plug>(coc-codeaction-source)", opts)
-- Remap keys for applying codeActions to the current buffer
keyset("n", "<leader>ac", "<Plug>(coc-codeaction)", opts)
-- Apply the most preferred quickfix action on the current line.
keyset("n", "<leader>qf", "<Plug>(coc-fix-current)", opts)

-- Run the Code Lens actions on the current line
keyset("n", "<localleader>cl", "<Plug>(coc-codelens-action)", opts)


keyset("x", "if", "<Plug>(coc-funcobj-i)", opts)
keyset("o", "if", "<Plug>(coc-funcobj-i)", opts)
keyset("x", "af", "<Plug>(coc-funcobj-a)", opts)
keyset("o", "af", "<Plug>(coc-funcobj-a)", opts)
keyset("x", "ic", "<Plug>(coc-classobj-i)", opts)
keyset("o", "ic", "<Plug>(coc-classobj-i)", opts)
keyset("x", "ac", "<Plug>(coc-classobj-a)", opts)
keyset("o", "ac", "<Plug>(coc-classobj-a)", opts)


---@diagnostic disable-next-line: redefined-local
local opts = { silent = true, nowait = true, expr = true }
keyset("n", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
keyset("n", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
keyset("i", "<C-f>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
keyset("i", "<C-b>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)
keyset("v", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
keyset("v", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)

opts = { silent = true, nowait = true }
keyset("n", "<space>d", ":<C-u>CocList diagnostics<cr>", opts)
keyset("n", "<space>e", ":<C-u>CocList extensions<cr>", opts)
keyset("n", "<space>j", ":<C-u>CocNext<cr>", opts)
keyset("n", "<space>k", ":<C-u>CocPrev<cr>", opts)

vim.g.coc_global_extensions = { 'coc-clangd', 'coc-symbol-line', 'coc-sumneko-lua', 'coc-go', 'coc-rust-analyzer',
    'coc-markdownlint',
    'coc-ecdict', 'coc-snippets', 'coc-cmake', 'coc-pairs', 'coc-json', 'coc-highlight', 'coc-emoji', 'coc-lists',
    'coc-yaml', 'coc-explorer' }

vim.g.coc_default_semantic_highlight_groups = 1


vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    command = ":silent call CocAction('runCommand', 'editor.action.organizeImport')"
})

keyset("n", "<C-s>", "<Plug>(coc-range-select)", { silent = true })
keyset("x", "<C-s>", "<Plug>(coc-range-select)", { silent = true })
-- Add `:Format` command to format current buffer
vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})

-- " Add `:Fold` command to fold current buffer
vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", { nargs = '?' })

-- Add `:OR` command for organize imports of the current buffer
vim.api.nvim_create_user_command("OR", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})


vim.cmd [[
autocmd BufEnter * call CheckOutline()
function! CheckOutline() abort
if &filetype ==# 'coctree' && winnr('$') == 1
  if tabpagenr('$') != 1
    close
  else
    bdelete
  endif
endif
endfunction

nnoremap <silent><nowait> <space>o  :call ToggleOutline()<CR>
  function! ToggleOutline() abort
    let winid = coc#window#find('cocViewId', 'OUTLINE')
    if winid == -1
      call CocActionAsync('showOutline', 1)
    else
      call coc#window#close(winid)
    endif
endfunction
]]
