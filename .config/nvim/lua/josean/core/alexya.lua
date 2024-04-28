-- The custom settins from alexya

local opt = vim.opt
opt.background = "light" -- customized the background to 'light'

-- The custm key map
local keymap = vim.keymap -- for conciseness

-- find the recent files (the same shrotcut as the visual studio code)
keymap.set("n", "<C-p>", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })

-- toggle the background
keymap.set(
  "n",
  "<leader>bg",
  ':exec &bg=="light"? "set bg=dark" : "set bg=light"<CR>',
  { noremap = true, silent = true, desc = "Toggle the background" }
)

-- select different colorscheme
function Select_next_colorscheme()
  local colorschemes = {
    "modus",
    "tokyonight",
    "visual_studio_code",
  }

  local current_colorscheme = vim.g.colors_name
  local next_index = 1

  for index, colorscheme in pairs(colorschemes) do
    if colorscheme == current_colorscheme then
      next_index = ((index % #colorschemes) + 1)
      break
    end
  end

  local next_colorscheme = colorschemes[next_index]
  vim.cmd("colorscheme " .. next_colorscheme)
  vim.notify("Applied colorscheme: " .. next_colorscheme, 1)
end
keymap.set("n", "<leader>co", "<cmd>lua Select_next_colorscheme()<cr>", { desc = "Select next colorscheme(theme)" })

-- open the Outline window on the right side
keymap.set("n", "<leader>ol", ":AerialToggle! right<CR>", { desc = "Launch outline panel" })
