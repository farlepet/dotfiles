-- Set leader key
leader = "\\"
vim.g.mapleader      = leader
vim.g.maplocalleader = leader




vim.o.laststatus = 2    -- Always show status line
--vim.opt.t_Co = 256
vim.o.encoding = "utf8" 

-- Line numbers
vim.o.number = true
vim.cmd("highlight LineNr ctermfg=grey guifg=#050505")

-- Enable mouse support
vim.o.mouse = "a"

-- Save undo history
vim.o.undofile = true

-- Preserve indentation on line-wrapping
vim.o.breakindent = true

-- Case-insensitive search by default
vim.o.ignorecase = true
vim.o.smartcase  = true
-- Highlight search
vim.o.hlsearch   = true

-- Show incomplete commands and show current mode
vim.o.showcmd  = true
vim.o.showmode = true

-- Disable audible bell
vim.o.visualbell = true

-- Enable smart indentation
vim.o.autoindent  = true
vim.o.smartindent = true

-- Set indentation
vim.o.shiftwidth  = 4
vim.o.softtabstop = 4
vim.o.tabstop     = 4
vim.o.expandtab   = true

-- Wrapping
vim.o.nowrap = true

-- Ignore these when tab-completing
vim.o.wildignore = "*.o,*~"

-- NOTE: Don't remember why I have this
vim.o.ttyfast = true

-- Share neovim and OS clipboard
-- vim.o.clipboard = 'unnamedplus'

-- Save swap file after this much inactivity (milliseconds)
vim.o.updatetime = 1000

-- Completion - always use menu, do not autoselect
vim.o.completeopt = "menuone,noselect"

-- Show trailing whitespace
vim.o.list = true
vim.opt.listchars.trail = "·"
vim.opt.listchars.tab   = "»"
vim.opt.listchars.nbsp  = "␣"

-- Highlight column 80 and 120
vim.o.colorcolumn = "80,120"
vim.cmd("highlight ColorColumn ctermbg=232 guibg=#2c2d27")

-- Set swap and backup directories to be centralized
vim.o.directory = vim.env.HOME .. "/.config/nvim/swap/"
vim.o.backupdir = vim.env.HOME .. "/.config/nvim/backup/"

--
-- Plugins
--

-- lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
    {
        "airblade/vim-gitgutter",
        "ctrlpvim/ctrlp.vim",
        "zivyangll-blame.vim",
        "preservim/nerdtree",
        "vim-airline/vim-airline",
        "vim-airline/vim-airline-themes",
        "bfrg/vim-cpp-modern",
        "dag/vim-fish"
    }
)

-- Nerd Tree
vim.NERDTreeIgnore = "['\\.o$']"

vim.g.webdevicons_enable_nerdtree = 1
vim.g.webdevicons_enable = 1
vim.g.WebDevIconsUnicodeDecorateFolderNodes = 1
vim.g.DevIconsEnableFoldersOpenClose = 1

-- Doxygen syntax highlighting
vim.g.load_doxygen_syntax=1

-- Ctrl-P
vim.g.ctrlp_working_path_mode = 0
-- Use ripgrep for Ctrl-P when available
if vim.fn.executable("rg") then
    vim.o.grepprg = "rg --vimgrep"
end

-- Airline (TODO: Clean this up)
vim.g.powerline_symbols     = "fancy"
vim.g.airline_left_sep      = ''
vim.g.airline_left_alt_sep  = ''
vim.g.airline_right_sep     = ''
vim.g.airline_right_alt_sep = ''
vim.cmd([[
    if !exists('g:airline_symbols')
      let g:airline_symbols = {}
    endif

    let g:airline_symbols.branch = ''
    let g:airline_symbols.colnr = ' ℅:'
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = ' :'
    let g:airline_symbols.maxlinenr = '☰ '
    let g:airline_symbols.dirty='⚡'
]])



--
-- Keybindings
--

-- ref: https://www.imaginaryrobots.net/posts/2021-04-17-converting-vimrc-to-lua/
local function map(mode, combo, mapping, opts)
  local options = {noremap = true}
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, combo, mapping, options)
end

-- Nerd Tree
map("n", "<C-f>", ":NERDTreeToggle<CR>")
--map("", "<C-F>", ":NERDTreeToggle %<CR>")

-- Git Blame
map("n", "<Leader>s", ":<C-u>call gitblame#echo()<CR>")

-- Tags
map("n", "<F12>", "g<C-]>")      -- Search for tag under cursor
map("n", "<F14>", "<C-w>g<C-]>") -- 
map("n", "<F11>", ":po<CR>")     -- Go back tag stack
map("n", "<F23>", ":ta<CR>")     -- Go forward tag stack

-- Tabs
map("n", "<C-t>",     ":tabnew<CR>") -- New tab
map("n", "<Leader>,", ":tabp<CR>")   -- Previous tab
map("n", "<Leader>.", ":tabn<CR>")   -- Next tab


--
-- Autocommands
--

-- Treat .json.example files as .json
vim.api.nvim_create_autocmd({"BufNewFile","BufRead"},{
    pattern = "*.json.example",
    callback = function(ev)
        vim.wo.filetype = "json"
    end
})

-- Makefiles must use real tabs
vim.api.nvim_create_autocmd({"FileType"},{
    pattern = "makefile",
    callback = function(ev)
        vim.wo.expandtab = false
    end
})

-- Theme
vim.cmd("source ~/.vim/themes/sourcerer")

