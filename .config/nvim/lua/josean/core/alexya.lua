-- The custom settins from alexya

local opt = vim.opt
opt.background = "light" -- customized the background to 'light'

-- The custm key map
local keymap = vim.keymap -- for conciseness

-- toggle the background
keymap.set(
  "n",
  "<leader>bg",
  ':exec &bg=="light"? "set bg=dark" : "set bg=light"<CR>',
  { noremap = true, silent = true, desc = "Toggle the background" }
)

-- select different colorscheme (it works well)
function Select_next_colorscheme()
  local colorschemes = {
    "modus",
    "tokyonight",
    "everforest",
    "vscode",
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

  vim.notify("Applied colorscheme: " .. next_colorscheme, vim.log.levels.INFO, {
    timeout = 500,
    render = "minimal",
    border = true,
  })
end
keymap.set("n", "<leader>cs", "<cmd>lua Select_next_colorscheme()<cr>", { desc = "Select the next colorscheme" })
-- keymap.set("n", "<leader>cs", ":Themery<CR>", { desc = "Select colorscheme from a list" })

-- open the Outline window on the right side
keymap.set("n", "<leader>ol", ":AerialToggle! right<CR>", { desc = "Launch outline panel" })

-- copy the full path of the current opened file to the clipboard
keymap.set("n", "<leader>fp", "<cmd>let @+=expand('%:p')<CR>", { desc = "Copy full path to clipboard" })

-- copy the current line without trailing newline to the clipboard
keymap.set(
  "n",
  "<leader>cp",
  'v$h"+y',
  { noremap = true, silent = true, desc = "Copy from current cursor to endline" }
)
keymap.set("n", "<S-y>", '0v$h"+y', { desc = "Copy the current line to the clipboard" })

-- copy the visual selection to the clipboard
keymap.set(
  "v",
  "<leader>cp",
  '"+y<CR>gv`><Esc>',
  { noremap = true, silent = true, desc = "Copy the visual selection to the clipboard" }
)
