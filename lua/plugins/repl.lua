return {
  {
    "Olical/conjure",
    ft = { "clojure", "clojurescript" },
    config = function()
      vim.g.conjure_mapping_prefix = "<localleader>c"

      vim.g.conjure_client_clojure_nrepl_connection_auto_repl = { "lein" }

      vim.g.conjure_client_clojurescript_nrepl_connection_auto_repl = { "figwheel" }

      vim.g.conjure_baleia = true

      vim.keymap.set("n", "<localleader>ce", "<cmd>ConjureEval<CR>", { desc = "Eval current form" })
      vim.keymap.set("n", "<localleader>cr", "<cmd>ConjureEvalRoot<CR>", { desc = "Eval and refresh" })
      vim.keymap.set("n", "<localleader>cc", "<cmd>ConjureConnect<CR>", { desc = "Connect to REPL" })

      vim.g.conjure_mapping_doc_word = "K"
      vim.g.conjure_mapping_def_word = "gd"
    end,
  },
  {
    "tpope/vim-dispatch",
    keys = {
      { "<leader>lf", "<cmd>Dispatch lein figwheel<CR>", desc = "Run Figwheel" },
      { "<leader>lb", "<cmd>Dispatch lein cljsbuild once prod<CR>", desc = "Build Prod" },
    },
  },
}
