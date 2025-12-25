--
-- File name:
-- plugins.lua
--

-- Gestionnaire de plugins (packer)
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

	-- Interface Git
	use 'tpope/vim-fugitive'        -- Git complet
	use 'kdheepak/lazygit.nvim'     -- Interface lazygit dans Neovim

    -- Interface et UI
    use {'nvim-tree/nvim-tree.lua', requires = 'nvim-tree/nvim-web-devicons'}
    use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
    use {'nvim-lualine/lualine.nvim', requires = 'nvim-tree/nvim-web-devicons'}
    use 'nvim-lua/plenary.nvim'
    use 'MunifTanjim/nui.nvim'
    use {'folke/noice.nvim', requires = {'MunifTanjim/nui.nvim', 'rcarriga/nvim-notify'}}
    use 'rcarriga/nvim-notify'
    use 'folke/edgy.nvim'
    use 'folke/tokyonight.nvim'

    -- Telescope et media
    use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
    use { '3rd/image.nvim', requires = 'nvim-lua/plenary.nvim' }

	-- Telescope File Browser
	use {
      "nvim-telescope/telescope-file-browser.nvim",
      requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    }

	-- LSP (Langage Server Protocol)
	use 'neovim/nvim-lspconfig'
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'

	-- Autocompletion
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use {
		"L3MON4D3/LuaSnip",
		tag = "v2.*"
	}

	-- Treesitter (coloration syntaxique avancée)
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

	-- Git intégration
	use 'lewis6991/gitsigns.nvim'  -- Voir les modifications git dans la marge
	use 'APZelos/blamer.nvim'

	-- Auto-pairs (ferme automatiquement les parenthèses)
	use 'windwp/nvim-autopairs'

    if packer_bootstrap then
        require('packer').sync()
    end
end)

-- EOF

