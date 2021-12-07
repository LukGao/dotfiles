local util = {}

function util.map(mode, key, action, opts)
  opts = vim.tbl_extend("keep", opts or {}, { noremap = true, silent = true, expr = false })
  vim.api.nvim_set_keymap(mode, key, action, opts)
end

function util.plugmap(mode, key, action, opts)
  opts = vim.tbl_extend("keep", opts or {}, { noremap = not vim.startswith(action, "<Plug>") })
  util.map(mode, key, action, opts)
end

function util.nmap(key, action, opts)
  util.plugmap("n", key, action, opts)
end

function util.vmap(key, action, opts)
  util.plugmap("v", key, action, opts)
end

function util.imap(key, action, opts)
  util.plugmap("i", key, action, opts)
end

function util.xmap(key, action, opts)
  util.plugmap("x", key, action, opts)
end

return util