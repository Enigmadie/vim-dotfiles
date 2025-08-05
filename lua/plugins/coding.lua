return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "InsertEnter",
    opts = {
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = "<C-l>",
          next = "<C-j>",
          dismiss = "<C-e>",
        },
      },
      filetypes = {
        markdown = true,
        help = true,
        gitcommit = true,
      },
    },
  },
  {
    "echasnovski/mini.surround",
    version = false,
    event = "VeryLazy",
    config = function()
      require("mini.surround").setup({
        mappings = {
          add = "ys", -- Add surrounding
          delete = "ds", -- Delete surrounding
          replace = "cs", -- Replace surrounding
          find = "", -- Optional: disable if не нужен
          find_left = "", -- Optional
          highlight = "", -- Optional
          update_n_lines = "", -- Optional
        },
      })
    end,
  },
}
