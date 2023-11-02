local opt = vim.opt

-- line numbers
opt.relativenumber = false -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)
opt.numberwidth = 2 -- number column width

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one
opt.smartindent = true -- smart indenting

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- appearance
opt.termguicolors = true -- enable 2 bit RGB colors, most modern terminal emulators support this
opt.guicursor = "n-v-c-i:block" -- cursor style in different modes, see :help 'guicursor'

opt.cmdheight = 1 -- height of command bar
opt.pumheight = 10 -- height of pop up menu
opt.scrolloff = 8 -- minimium number of lines above and below the cursor
opt.sidescrolloff = 8 -- minimum number of columns on the left and right of the cursor
opt.signcolumn = "yes" -- always show the sign column
opt.showmode = false -- won't show the mode in the command bar

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register
