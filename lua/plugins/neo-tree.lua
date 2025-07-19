return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      bind_to_cwd = true,
      window = {
        mappings = {
          ["o"] = { "open", nowait = true },
          ["<Enter>"] = { "open", nowait = true },
          ["u"] = "navigate_up",
          ["<bs>"] = "none",
          ["i"] = function(state)
            local node = state.tree:get_node()
            if node and node.path then
              vim.cmd("wincmd p")
              vim.cmd("split " .. vim.fn.fnameescape(node.path))
            end
          end,
          ["s"] = function(state)
            local node = state.tree:get_node()
            if node and node.path then
              vim.cmd("wincmd p")
              vim.cmd("vsplit " .. vim.fn.fnameescape(node.path))
            end
          end,
        },
        width = 30,
      },
      filtered_items = {
        visible = true,
        show_hidden_count = true,
        hide_dotfiles = false,
        hide_gitignored = false,
      },
    },
  },
}
