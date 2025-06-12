return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    lazy = false, -- neo-tree will lazily load itself
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          -- hide_dotfiles = false,
          hide_by_name = {},
          never_show = { ".git" },
        },
      },
    },
    config = function(_, opts)
      require("neo-tree").setup(opts)
      vim.keymap.set("n", "<C-n>", ":Neotree filesystem toggle left<CR>", {})
      vim.keymap.set("n", "P", ":Neotree filesystem")
    end,
  },
}
