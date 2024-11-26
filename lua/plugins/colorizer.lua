return {
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    event = "VeryLazy",
    config = function()
      require("tailwindcss-colorizer-cmp").setup {
        color_square_width = 2,
      }
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        "*",
        css = { rgb_fn = true },
        html = { names = true },
      }, {
        rgb_fn = true,
        hsl_fn = true,
        css = true,
        css_fn = true,
      })

      vim.cmd [[ColorizerToggle]]
    end,
  },
}
