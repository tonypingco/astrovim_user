-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map

    -- navigate buffer tabs with `H` and `L`
    L = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    H = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },

    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- ["<leader>lf"] = {
    --   function() vim.lsp.buf.format { async = true } end,
    --   desc = "LSP formatting",
    -- },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command
    -- ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", desc = "window left" },
    -- ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", desc = "window right" },
    -- ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", desc = "window down" },
    -- ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", desc = "window up" },
    ["<C-a>"] = { "gg<S-v>G" },
    ["ss"] = { ":split<CR><C-w>w", desc = "split screen horizontally" },
    ["sv"] = { ":vsplit<CR><C-w>w", desc = "split screen vertically" },
    ["sh"] = { "<C-w>h", desc = "move cursor left" },
    ["sl"] = { "<C-w>l", desc = "move cursor right" },
    ["sj"] = { "<C-w>j", desc = "move cursor down" },
    ["sk"] = { "<C-w>k", desc = "move cursor up" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  v = {
    ["J"] = { ":m '>+1<CR>gv=gv", desc = "Move line/selected down" },
    ["K"] = { ":m '<-2<CR>gv=gv", desc = "Move line/selected up" },
  },
}
