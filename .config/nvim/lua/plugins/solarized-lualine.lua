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
  lightgray = 12,
  inactivegray = 11,
}
return {
  normal = {
    a = { bg = colors.lightgray, fg = colors.base02, gui = "bold" },
    b = { bg = colors.base02, fg = colors.lightgray },
    c = { bg = colors.base03, fg = colors.gray },
  },
  insert = {
    a = { bg = colors.blue, fg = colors.base02, gui = "bold" },
    b = { bg = colors.base02, fg = colors.lightgray },
    c = { bg = colors.base03, fg = colors.gray },
  },
  visual = {
    a = { bg = colors.magenta, fg = colors.base02, gui = "bold" },
    b = { bg = colors.base02, fg = colors.lightgray },
    c = { bg = colors.base03, fg = colors.gray },
  },
  replace = {
    a = { bg = colors.red, fg = colors.base02, gui = "bold" },
    b = { bg = colors.base02, fg = colors.lightgray },
    c = { bg = colors.base03, fg = colors.gray },
  },
  command = {
    a = { bg = colors.green, fg = colors.base02, gui = "bold" },
    b = { bg = colors.base02, fg = colors.lightgray },
    c = { bg = colors.base03, fg = colors.gray },
  },
  inactive = {
    a = { bg = colors.darkgray, fg = colors.base02 },
    b = { bg = colors.base02, fg = colors.lightgray },
    c = { bg = colors.base02, fg = colors.gray },
  },
}
