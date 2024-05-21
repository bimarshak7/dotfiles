return{
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 999,
	config = function()
		require("catppuccin").setup {
			flavour = "mocha",
			transparent_background = true,
		    custom_highlights = function(colors)
		        return {
		            LineNr = { fg = colors.mauve },
		        }
		    end
			}
		vim.cmd.colorscheme "catppuccin"

	end		
}