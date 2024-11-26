return {
  "windwp/nvim-ts-autotag",
  event = "VeryLazy",
  ft = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "svelte",
  },
  config = function()
    require("nvim-ts-autotag").setup()
  end,
}
