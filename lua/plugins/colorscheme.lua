return {
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "night",
      transparent = false,
      styles = {
        sidebars = "dark",
        floats = "dark",
        -- Можно добавить стиль для разделителей
        -- но настраивается ниже через highlight_overrides
      },
      on_colors = function(colors)
        colors.bg = "#0d0d14" -- было #1a1b26
        colors.bg_dark = "#0a0a11" -- было #16161e
        colors.bg_float = colors.bg_dark
        colors.border = "#3a3a52"
      end,
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
