return {
  -- undo tree
  {
    'mbbill/undotree',
    keys = {
      { '<leader>u', '<cmd>UndotreeToggle<CR>', desc = 'Toggle UndoTree' },
    },
    config = function()
      vim.g.undotree_WindowLayout = 3
    end,
  },
}
