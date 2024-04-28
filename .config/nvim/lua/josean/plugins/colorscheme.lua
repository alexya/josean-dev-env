return {
  {
    "miikanissi/modus-themes.nvim",
    -- "askfiy/visual_studio_code",
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme modus]])
    end,
  },
  -- {
  --   "askfiy/visual_studio_code",
  --   priority = 1000,
  --   config = function()
  --     vim.cmd([[colorscheme visual_studio_code]])
  --   end,
  -- },
}
