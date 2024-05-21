return{
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 999,
	config = function()
		vim.cmd.colorscheme "catppuccin"
	end		
}