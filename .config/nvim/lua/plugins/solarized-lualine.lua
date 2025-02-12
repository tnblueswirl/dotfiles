local colors = {
  base03 = 8, -- background
  base02 = 0, -- background highlights
  base0 = 15, -- body text
  yellow = 3,
  orange = 9,
  red = 1,
  green = 2,
  blue = 4,
  magenta = 5,
  cyan = 6,
  violet = 13,
  gray = 11,
  darkgray = 10,
  lightgray = 14,
}
return {
  normal = {
    a = { bg = colors.lightgray, fg = colors.base0, gui = "bold" },
    b = { bg = colors.gray, fg = colors.base0 },
    c = { bg = colors.base02, fg = colors.gray },
  },

  insert = {
    a = { bg = colors.yellow, fg = colors.base0, gui = "bold" },
    b = { bg = colors.gray, fg = colors.base0 },
    c = { bg = colors.base02, fg = colors.gray },
  },
  visual = {
    a = { bg = colors.magenta, fg = colors.base0, gui = "bold" },
    b = { bg = colors.gray, fg = colors.base0 },
    c = { bg = colors.base02, fg = colors.gray },
  },
  replace = {
    a = { bg = colors.red, fg = colors.base0, gui = "bold" },
    b = { bg = colors.gray, fg = colors.base0 },
    c = { bg = colors.base02, fg = colors.gray },
  },
  command = {
    a = { bg = colors.blue, fg = colors.base0, gui = "bold" },
    b = { bg = colors.gray, fg = colors.base0 },
    c = { bg = colors.base02, fg = colors.gray },
  },
  inactive = {
    a = { bg = colors.darkgray, fg = colors.base0 },
    b = { bg = colors.gray, fg = colors.base0 },
    c = { bg = colors.darkgray, fg = colors.base03 },
  },
}
