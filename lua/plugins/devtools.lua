return {
  -- NVIM LSP
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      servers = {
        eslint = {
          settings = {
            experimental = {
              useFlatConfig = true,
            },
          },
        },
        tsserver = {
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
          },
        },
      },
    },
    setup = {
      tsserver = function(_, opts)
        require("lspconfig").tsserver.setup({
          settings = opts.settings,
          on_attach = function(client, bufnr)
            -- Отключаем форматирование через tsserver, используем conform.nvim
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false

            -- Автоимпорты при сохранении
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.code_action({
                  context = { only = { "source.organizeImports" } },
                  apply = true,
                })
              end,
            })
          end,
        })
        return true
      end,
    },
  },

  -- JS/TS LSP
  -- {
  --   "pmizio/typescript-tools.nvim",
  --   dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  --   ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  --   opts = {
  --     on_attach = function(client, bufnr)
  --       vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
  --     end,
  --     settings = {
  --       tsserver_plugins = {},
  --       expose_as_code_action = "all",
  --     },
  --   },
  -- },
  --
  -- { import = "lazyvim.plugins.extras.lsp.none-ls" },
  --
  -- {
  --   "nvimtools/none-ls.nvim",
  --   opts = function(_, opts)
  --     local nls = require("null-ls")
  --     opts.sources = vim.list_extend(opts.sources or {}, {
  --       nls.builtins.formatting.eslint_d,
  --       nls.builtins.diagnostics.eslint_d,
  --       nls.builtins.code_actions.eslint_d,
  --     })
  --   end,
  -- },

  {
    "vuki656/package-info.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
      require("package-info").setup({
        autostart = true,
        hide_up_to_date = false,
      })
    end,
  },

  -- RUST
  {
    "mrcjkb/rustaceanvim",
    version = "^4",
    ft = { "rust" },
  },

  {
    "powerman/vim-plugin-ruscmd",
    event = "VeryLazy",
  },
}
