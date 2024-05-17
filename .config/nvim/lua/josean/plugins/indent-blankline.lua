return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  main = "ibl",
  -- commit = "29be0919b91fb59eca9e90690d76014233392bef", -- to resolve a runtime issue on Windows OS
  opts = {
    indent = { char = "┊" },
    -- indent = { char = "│" },
    -- scope = { enabled = false },
    exclude = {
      filetypes = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "trouble",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "lazyterm",
      },
    },
  },
}
