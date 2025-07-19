return {
  "folke/flash.nvim",
  keys = {
    {
      "ss",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump()
      end,
      desc = "Flash Jump",
    },
  },
  opts = {
    modes = {
      char = {
        enabled = false,
      },
      char2 = {
        enabled = false,
      },
    },
  },
}
