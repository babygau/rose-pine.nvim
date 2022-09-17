local p = require 'rose-pine.palette'

return {
  normal = {
    a = { bg = p.none, fg = p.rose, gui = 'bold' },
    b = { bg = p.none, fg = p.text },
    c = { bg = p.none, fg = p.subtle, gui = 'italic' },
  },
  insert = {
    a = { bg = p.none, fg = p.foam, gui = 'bold' },
  },
  visual = {
    a = { bg = p.none, fg = p.iris, gui = 'bold' },
  },
  replace = {
    a = { bg = p.none, fg = p.pine, gui = 'bold' },
  },
  command = {
    a = { bg = p.none, fg = p.love, gui = 'bold' },
  },
  inactive = {
    a = { bg = p.none, fg = p.subtle, gui = 'bold' },
    b = { bg = p.none, fg = p.subtle },
    c = { bg = p.none, fg = p.subtle, gui = 'italic' },
  },
}
