vim.filetype.add {
  extension = {
    mdx = "mdx",
  },
}

return {
  { "mfussenegger/nvim-dap" },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim"
    },
    opts = {
      ensure_installed = {
        "prettierd",
        "tailwindcss-language-server",
        "typescript-language-server",
      },
    },
    config = function()
      local mason_tool_installer = require("mason-tool-installer")

      mason_tool_installer.setup({
        ensure_installed = {
          "prettierd",
          "stylua",
          "eslint_d"
        }
      })
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      return {
        ensure_installed = {
          "lua",
          "html",
          "css",
          "javascript",
          "typescript",
          "tsx",
          "json",
          "svelte",
        },

        highlight = {
          enable = true,
        },

        indent = {
          enable = true,
        },

        auto_install = true,
      }
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "syntax")
      require("nvim-treesitter.configs").setup(opts)
      vim.treesitter.language.register("markdown", "mdx")
      require("nvim-treesitter").define_modules {
        mdx_ext = {
          extend = function(lang, _)
            if lang == "markdown" then
              return {
                injections = {
                  {
                    language = "typescript",
                    content = {
                      "^%s*import",
                      "^%s*export",
                    },
                  },
                },
              }
            end
          end,
        },
      }
    end,
  },
}
