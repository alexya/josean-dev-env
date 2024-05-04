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
  -- join or split a clode block e.g. class, objuect, function, if-condiftion, etc.
  {
    "Wansmer/treesj",
    event = "VeryLazy",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesj").setup({
        use_default_keymaps = false,
        max_join_length = 240,
      })

      vim.keymap.set("n", "<leader>jt", function()
        require("treesj").toggle({ split = { recursive = true } })
      end, { desc = "Toggle the merge/split code block" })
    end,
  },
  -- Change the colors, opacity of the theme
  -- {
  --   "mvllow/modes.nvim",
  --   tag = "v0.2.1",
  --   config = function()
  --     require("modes").setup()
  --   end,
  -- },
}
