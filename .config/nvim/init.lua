-- Set leader key
local leader = "\\"
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
local tabsize = 4
vim.o.shiftwidth  = tabsize
vim.o.softtabstop = tabsize
vim.o.tabstop     = tabsize
vim.o.expandtab   = true

-- Wrapping
vim.wo.wrap = true

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
        -- Detect tabstop and shiftwidth automatically
        'tpope/vim-sleuth',

        "airblade/vim-gitgutter",
        --"ctrlpvim/ctrlp.vim",
        "zivyangll/git-blame.vim",
        "preservim/nerdtree",
        "vim-airline/vim-airline",
        "vim-airline/vim-airline-themes",
        "bfrg/vim-cpp-modern",
        "dag/vim-fish",
        "tikhomirov/vim-glsl",
        "HiPhish/rainbow-delimiters.nvim",

        { 'folke/which-key.nvim', opts = {} },

        {
            -- LSP Configuration & Plugins
            'neovim/nvim-lspconfig',
            dependencies = {
                -- Automatically install LSPs to stdpath for neovim
                { 'williamboman/mason.nvim', config = true },
                'williamboman/mason-lspconfig.nvim',

                -- Useful status updates for LSP
                -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
                { 'j-hui/fidget.nvim', opts = {} },

                -- Additional lua configuration, makes nvim stuff amazing!
                'folke/neodev.nvim',
            },
        },

        {
            -- Autocompletion
            'hrsh7th/nvim-cmp',
            dependencies = {
                -- Snippet Engine & its associated nvim-cmp source
                'L3MON4D3/LuaSnip',
                'saadparwaiz1/cmp_luasnip',

                -- Adds LSP completion capabilities
                'hrsh7th/cmp-nvim-lsp',
                'hrsh7th/cmp-path',

                -- Adds a number of user-friendly snippets
                --'rafamadriz/friendly-snippets',
            },
        },

        -- Fuzzy Finder (files, lsp, etc)
        {
            'nvim-telescope/telescope.nvim',
            branch = '0.1.x',
            dependencies = {
                'nvim-lua/plenary.nvim',
                -- Fuzzy Finder Algorithm which requires local dependencies to be built.
                -- Only load if `make` is available. Make sure you have the system
                -- requirements installed.
                {
                    'nvim-telescope/telescope-fzf-native.nvim',
                    -- NOTE: If you are having trouble with this installation,
                    --       refer to the README for telescope-fzf-native for more instructions.
                    build = 'make',
                    cond = function()
                      return vim.fn.executable 'make' == 1
                    end,
                },
            },
        },
        {
            -- Highlight, edit, and navigate code
            'nvim-treesitter/nvim-treesitter',
            dependencies = {
                'nvim-treesitter/nvim-treesitter-textobjects',
                'joelspadin/tree-sitter-devicetree'
            },
            build = ':TSUpdate',
        },
        -- Color scheme
        --{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
        "rebelot/kanagawa.nvim",
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
--vim.g.ctrlp_working_path_mode = 0
-- Use ripgrep for Ctrl-P when available
--if vim.fn.executable("rg") then
--    vim.o.grepprg = "rg --vimgrep"
--end

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

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
-- Defer Treesitter setup after first render to improve startup time of 'nvim {filename}'
vim.defer_fn(function()
    require('nvim-treesitter.configs').setup {
        -- Add languages to be installed here that you want installed for treesitter
        ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'javascript', 'typescript', 'vimdoc', 'vim', 'bash', 'devicetree', 'latex' },

        -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
        auto_install = false,

        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = '<c-space>',
                node_incremental = '<c-space>',
                scope_incremental = '<c-s>',
                node_decremental = '<M-space>',
            },
        },
        textobjects = {
            select = {
                enable = true,
                lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
                keymaps = {
                    -- You can use the capture groups defined in textobjects.scm
                    ['aa'] = '@parameter.outer',
                    ['ia'] = '@parameter.inner',
                    ['af'] = '@function.outer',
                    ['if'] = '@function.inner',
                    ['ac'] = '@class.outer',
                    ['ic'] = '@class.inner',
                },
            },
            move = {
                enable = true,
                set_jumps = true, -- whether to set jumps in the jumplist
                goto_next_start = {
                    [']m'] = '@function.outer',
                    [']]'] = '@class.outer',
                },
                goto_next_end = {
                    [']M'] = '@function.outer',
                    [']['] = '@class.outer',
                },
                goto_previous_start = {
                    ['[m'] = '@function.outer',
                    ['[['] = '@class.outer',
                },
                goto_previous_end = {
                    ['[M'] = '@function.outer',
                    ['[]'] = '@class.outer',
                },
            },
            swap = {
                enable = true,
                swap_next = {
                    ['<leader>a'] = '@parameter.inner',
                },
                swap_previous = {
                    ['<leader>A'] = '@parameter.inner',
                },
            },
          },
      }
end, 0)

-- [[ Configure LSP ]]
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
    -- NOTE: Remember that lua is a real programming language, and as such it is possible
    -- to define small helper and utility functions so you don't have to repeat yourself
    -- many times.
    --
    -- In this case, we create a function that lets us more easily define mappings specific
    -- for LSP related items. It sets the mode, buffer and description for us each time.
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

    nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
    nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
    nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    -- See `:help K` for why this keymap
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

    -- Lesser used LSP functionality
    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    nmap('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[W]orkspace [L]ist Folders')

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })
end

-- mason-lspconfig requires that these setup functions are called in this order
-- before setting up the servers.
require('mason').setup()
require('mason-lspconfig').setup()

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
--
--  If you want to override the default filetypes that your language server will attach to you can
--  define the property 'filetypes' to the map in question.
local servers = {
    -- clangd = {},
    -- gopls = {},
    -- pyright = {},
    rust_analyzer = {},
    -- tsserver = {},
    -- html = { filetypes = { 'html', 'twig', 'hbs'} },

    lua_ls = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            -- NOTE: toggle below to ignore Lua_LS's noisy `missing-fields` warnings
            -- diagnostics = { disable = { 'missing-fields' } },
        },
    },
}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
    ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
   function(server_name)
      require('lspconfig')[server_name].setup {
         capabilities = capabilities,
         on_attach = on_attach,
         settings = servers[server_name],
         filetypes = (servers[server_name] or {}).filetypes,
      }
   end,
}


-- [[ Configure nvim-cmp ]]
-- See `:help cmp`
local cmp = require 'cmp'
local luasnip = require 'luasnip'
require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}

cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    completion = {
        completeopt = 'menu,menuone,noinsert',
    },
    mapping = cmp.mapping.preset.insert {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete {},
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_locally_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    },
    sources = {
        { name = 'nvim_lsp' },
        --{ name = 'luasnip' },
        { name = 'path' },
    },
}

require('rainbow-delimiters');


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

-- Telescope
vim.keymap.set("n", "<C-p>", require("telescope.builtin").find_files, {})
-- NERDTree
map("n", "<C-f>", ":NERDTreeToggle .<CR>")
map("n", "<CS-f>", ":NERDTreeToggle %<CR>")

-- Git Blame
map("n", "<Leader>s", ":<C-u>call gitblame#echo()<CR>")

-- Tags
map("n", "<F12>", "g<C-]>")      -- Search for tag under cursor
map("n", "<F24>", "<C-w>g<C-]>") --
map("n", "<F11>", ":po<CR>")     -- Go back tag stack
map("n", "<F23>", ":ta<CR>")     -- Go forward tag stack

-- Tabs
map("n", "<C-t>",     ":tabnew<CR>") -- New tab
map("n", "<Leader>[", ":tabp<CR>")   -- Previous tab
map("n", "<Leader>]", ":tabn<CR>")   -- Next tab


--
-- Autocommands
--

-- Treat .json.example files as .json
vim.api.nvim_create_autocmd({"BufNewFile","BufRead"},{
    pattern = "*.json.example",
    callback = function(ev)
        vim.bo.filetype = "json"
    end
})

-- Treat .schema files as .json (with comments)
vim.api.nvim_create_autocmd({"BufNewFile","BufRead"},{
    pattern = "*.schema",
    callback = function(ev)
        vim.bo.filetype = "jsonc"
    end
})

-- Treat rc files as shell scripts
vim.api.nvim_create_autocmd({"BufNewFile","BufRead"},{
    pattern = "rc",
    callback = function(ev)
        vim.bo.filetype = "sh"
    end
})

-- CGI/Page files are written in shell+html
vim.api.nvim_create_autocmd({"BufNewFile","BufRead"},{
    pattern = { "*.cgi", "*.page" },
    callback = function(ev)
        vim.bo.filetype = "sh"
    end
})

-- Makefiles must use real tabs
vim.api.nvim_create_autocmd({"FileType"},{
    pattern = "makefile",
    callback = function(ev)
        vim.wo.expandtab = false
    end
})

-- Set color scheme
-- require("catppuccin").setup({
--    flavor = "mocha",
--    transparent_background = true,
--    dim_inactive = {
--        enabled = false,
--        percentage = 0.15,
--    }
--})
--vim.cmd.colorscheme "catppuccin"
require("kanagawa").setup({
    transparent = true,

})
vim.cmd.colorscheme "kanagawa"
