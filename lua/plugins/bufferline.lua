return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  config = function()
    require("bufferline").setup({
      options = {
        numbers = "ordinal",
        show_buffer_close_icons = false,
        show_close_icon = false,
        separator_style = "slant",
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "center",
            padding = 2,
          },
        },
      },
    })
  end,
}
