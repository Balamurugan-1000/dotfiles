return {
  {
    "edkolev/tmuxline.vim",
    event = "VeryLazy",
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",

    opts = function()
      -- Load and safely patch TokyoNight theme
      local theme = require("lualine.themes.tokyonight")

      -- Transparent backgrounds, but still valid for tmuxline
      for _, mode in pairs(theme) do
        for _, hl in pairs(mode) do
          if hl.bg then
            hl.bg = "" -- EMPTY STRING = valid (NONE = INVALID in tmuxline)
          end
        end
      end

      return {
        options = {
          theme = theme,
          globalstatus = true,
          icons_enabled = true,
          section_separators = { left = "", right = "" },
          component_separators = { left = "", right = "" },
          disabled_filetypes = {
            statusline = { "alpha", "dashboard", "starter", "neo-tree" },
          },
        },

        sections = {
          lualine_a = {},
          lualine_b = {
            { "branch", icon = "" },
            {
              "diff",
              symbols = { added = " ", modified = " ", removed = " " },
            },
          },
          lualine_c = {
            {
              "filename",
              path = 0,
              symbols = {
                modified = " ●",
                readonly = " 🔒",
                unnamed = "😒",
                newfile = " ",
              },
            },
          },
          lualine_x = {
            {
              "diagnostics",
              symbols = {
                error = " ",
                warn = " ",
                info = " ",
                hint = " ",
              },
              always_visible = true,
            },
            { "filetype", icon_only = true },
            { "fileformat" },
          },
          lualine_y = { "location" },
          lualine_z = {},
        },

        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {
            {
              "filename",
              path = 0,
              symbols = {
                modified = " ●",
                readonly = " 🔒",
                unnamed = "😒",
              },
            },
          },
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
      }
    end,

    config = function(_, opts)
      require("lualine").setup(opts)

      -- Run :Tmuxline before :TmuxlineSnapshot
      vim.defer_fn(function()
        vim.cmd("Tmuxline tokyonight")                      -- ① generate tmuxline theme
        vim.cmd("TmuxlineSnapshot! ~/.tmux/tmuxline.conf")  -- ② write snapshot
      end, 300)
    end,
  },
}

