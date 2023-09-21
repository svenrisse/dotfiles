-- set colorscheme to nightfly with protected call
-- in case it isn't installed

-- colorscheme tokyonight-storm
-- colorscheme onedark

local status, _ = pcall(vim.cmd, "colorscheme tokyonight-storm")
if not status then
  print("Colorscheme not found!") -- print error if colorscheme not installed
  return
end
