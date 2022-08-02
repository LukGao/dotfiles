return function()
    require('ufo').setup({
        open_fold_hl_timeout = 150,
        preview = {
            win_config = {
                border = {'', '─', '', '', '', '─', '', ''},
                winhighlight = 'Normal:Folded',
                winblend = 0
            },
            mappings = {
                scrollU = '<C-u>',
                scrollD = '<C-d>'
            }
        },
    })
    vim.keymap.set('n', 'K', function()
        local winid = require('ufo').peekFoldedLinesUnderCursor()
        if not winid then
            vim.fn.CocActionAsync('definitionHover')
        end
    end)
    vim.cmd[[
        hi default link UfoPreviewSbar PmenuSbar
        hi default link UfoPreviewThumb PmenuThumb
        hi default link UfoFoldedEllipsis Comment
    ]]
end
