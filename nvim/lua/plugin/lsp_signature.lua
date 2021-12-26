return function ()
  require('lsp_signature').setup({
    floating_window = true,
    handler_opts = {
      border = "single"   -- double, rounded, single, shadow, none
    },
    hint_enable = false,
    hint_prefix = " ",
    toggle_key = '<M-s>'
  })
end
