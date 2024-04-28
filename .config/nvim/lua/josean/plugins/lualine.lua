return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "miikanissi/modus-themes.nvim", -- colorscheme "modus"
    "askfiy/visual_studio_code",
    "folke/tokyonight.nvim",
  },
  config = function()
    local lualine = require("lualine")

    -- configure lualine with modified theme
    lualine.setup({
      options = {
        -- theme = "tokyonight",
        -- theme = "visual_studio_code",
        -- theme = "modus",
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },

      -- sections = {
      --   lualine_x = {
      --     -- {
      --     --   lazy_status.updates,
      --     --   cond = lazy_status.has_updates,
      --     --   color = { fg = "#ff9e64" },
      --     -- },
      --     { "encoding" },
      --     { "fileformat" },
      --     { "filetype" },
      --   },
      -- },

      -- options = {
      --   theme = "visual_studio_code",
      --   icons_enabled = true,
      --   component_separators = { left = "", right = "" },
      --   section_separators = { left = "", right = "" },
      --   disabled_filetypes = {},
      --   globalstatus = true,
      --   refresh = {
      --     statusline = 100,
      --   },
      -- },
      -- sections = require("visual_studio_code").get_lualine_sections(),
    })
  end,
}
