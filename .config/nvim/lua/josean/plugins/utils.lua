return {
  -- Outline panel to navigate the symbols
  {
    "stevearc/aerial.nvim",
    event = "VeryLazy",
    opts = {
      layout = {
        max_width = { 40, 0.3 },
        width = nil,
        min_width = 30,
      },
    },
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },
}
