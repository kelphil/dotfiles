"--------------------------------------------------------------
" NeoVim Settings - Kelvin Philip
"--------------------------------------------------------------
"     _            ___       _ _         _
"    | | ___ __   |_ _|_ __ (_) |___   _(_)_ __ ___
"    | |/ / '_ \   | || '_ \| | __\ \ / / | '_ ` _ \
"    |   <| |_) |  | || | | | | |_ \ V /| | | | | | |
"    |_|\_\ .__/  |___|_| |_|_|\__(_)_/ |_|_| |_| |_|
"         |_|
"
"--------------------------------------------------------------
"
"--------------------------------------------------------------
" Reuse Vim Config
"--------------------------------------------------------------
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
"
"--------------------------------------------------------------
" Language Server Plugins
"--------------------------------------------------------------
"lua << EOF
"require'lspconfig'.pyright.setup{}
"require'lspconfig'.bashls.setup{}
"EOF
"
"--------------------------------------------------------------
" Compe setup
"--------------------------------------------------------------
" lua << EOF
" require'compe'.setup {
"   enabled = true;
"   autocomplete = true;
"   debug = false;
"   min_length = 1;
"   preselect = 'enable';
"   throttle_time = 80;
"   source_timeout = 200;
"   incomplete_delay = 400;
"   max_abbr_width = 100;
"   max_kind_width = 100;
"   max_menu_width = 100;
"   documentation = true;
"   source = {
"     path = true;
"     buffer = true;
"     calc = true;
"     nvim_lsp = false;
"     nvim_lua = true;
"   };
" }
" 
" local t = function(str)
"   return vim.api.nvim_replace_termcodes(str, true, true, true)
" end
" 
" local check_back_space = function()
"     local col = vim.fn.col('.') - 1
"     if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
"         return true
"     else
"         return false
"     end
" end
" -- Use (s-)tab to:
" --- move to prev/next item in completion menuone
" --- jump to prev/next snippet's placeholder
" 
" _G.tab_complete = function()
"   if vim.fn.pumvisible() == 1 then
"     return t "<C-n>"
"   elseif check_back_space() then
"     return t "<Tab>"
"   else
"     return vim.fn['compe#complete']()
"   end
" end
" 
" _G.s_tab_complete = function()
"   if vim.fn.pumvisible() == 1 then
"     return t "<C-p>"
"   else
"     return t "<S-Tab>"
"   end
" end
" 
" vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
" vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
" vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
" vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
" EOF
" "
" "--------------------------------------------------------------
" " Keybindings
"--------------------------------------------------------------
lua << EOF
-- local nvim_lsp = require('lspconfig')
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- Mappings.
  local opts = { noremap=true, silent=true }
  -- See `:help vim.lsp.*` for documentation on any of the below functions
-- buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
-- buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
-- buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
-- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
-- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
-- buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
-- buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
-- buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
-- buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
-- buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
-- buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
-- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
-- buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
-- buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
-- buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
-- buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
-- buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end
-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
-- local servers = { "pyright", "tsserver" }
-- for _, lsp in ipairs(servers) do
-- nvim_lsp[lsp].setup { on_attach = on_attach }
-- end
EOF
"
"--------------------------------------------------------------
" LSP Saga
"--------------------------------------------------------------
" lua << EOF
" local saga = require 'lspsaga'
" saga.init_lsp_saga {
"   code_action_icon = '',
"   code_action_prompt = {
"     enable = true,
"     sign = true,
"     sign_priority = 20,
"     virtual_text = false,
"   },
"   code_action_keys = { quit = {'q', '<ESC>'}, exec = '<CR>' },
"   border_style = "round",
" }
" EOF
"
"--------------------------------------------------------------
" Trouble
"--------------------------------------------------------------
lua << EOF
  require("trouble").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF
"
"--------------------------------------------------------------
" TO-DO Comments
"--------------------------------------------------------------
lua << EOF
  require("todo-comments").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF
"
"--------------------------------------------------------------
" Which-Key
"--------------------------------------------------------------
lua << EOF
  require("which-key").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF
"
"--------------------------------------------------------------
" LSP Signature
"--------------------------------------------------------------
lua << EOF
-- require'lsp_signature'.on_attach()
EOF
"
"--------------------------------------------------------------
" Telescope
"--------------------------------------------------------------
lua << EOF
local actions = require('telescope.actions')
require('telescope').setup {
  defaults = {
    file_sorter = require('telescope.sorters').get_fzy_sorter,
    prompt_prefix = ' $ ',
    color_devicons = true,
    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

    mappings = {
        i = {
            ["<C-x>"] = false,
            ["<C-q>"] = actions.send_to_qflist,
        },
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = false, -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    },
    fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true,
    }
  }
}
require('telescope').load_extension('fzy_native')
require('telescope').load_extension('coc')
EOF
"--------------------------------------------------------------
