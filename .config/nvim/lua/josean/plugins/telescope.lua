return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local transform_mod = require("telescope.actions.mt").transform_mod

    local trouble = require("trouble")
    local trouble_telescope = require("trouble.sources.telescope")

    -- or create your custom action
    local custom_actions = transform_mod({
      open_trouble_qflist = function(prompt_bufnr)
        trouble.toggle("quickfix")
      end,
    })

    local select_one_or_multi = function(prompt_bufnr)
      local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
      local multi = picker:get_multi_selection()
      if not vim.tbl_isempty(multi) then
        require("telescope.actions").close(prompt_bufnr)
        for _, j in pairs(multi) do
          if j.path ~= nil then
            vim.cmd(string.format("%s %s", "tabe", j.path)) -- open the file in a new tab
          end
        end
      else
        -- require("telescope.actions").select_default(prompt_bufnr) -- open the file in the current tab
        require("telescope.actions").select_tab(prompt_bufnr) -- open the file in a new tab
      end
    end

    telescope.setup({
      defaults = {
        sorting_strategy = "ascending",
        layout_config = {
          width = 0.8,
          height = 0.9,
          prompt_position = "top",
          preview_cutoff = 120,
        },
        -- for exmaple to ignore some folders or files
        file_ignore_patterns = {
          "yarn.lock",
          "package-lock.json",
          "lazy-lock.json",
          ".git/.*",
        },
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
            ["<C-o>"] = actions.select_tab, -- open the current selected file in a new tab
            ["<C-t>"] = trouble_telescope.open,
            ["<TAB>"] = actions.toggle_selection,
            ["<C-CR>"] = select_one_or_multi,
          },
          n = {
            ["<C-o>"] = actions.select_tab, -- open the current selected file in a new tab
            ["t"] = actions.toggle_selection,
            ["<TAB>"] = actions.toggle_selection,
            ["<C-CR>"] = select_one_or_multi,
          },
        },
      },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("notify")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    -- find the files (using the same shortcut as the visual studio code)
    keymap.set(
      "n",
      "<C-p>",
      "<cmd>lua require('telescope.builtin').find_files({ layout_strategy = 'vertical' })<cr>",
      { desc = "Fuzzy find files in cwd" }
    )
    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
    keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Find help tags" })
    keymap.set("n", "<leader>ft", "<cmd>Telescope tags<cr>", { desc = "Find tags" })
    keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })
    keymap.set("n", "<leader>fk", "<cmd>Telescope marks<cr>", { desc = "Find marks" })
    keymap.set("n", "<leader>fn", "<cmd>Telescope notify<cr>", { desc = "Find notifications" })
    -- keymap.set("n", "<leader>fo", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
  end,
}
