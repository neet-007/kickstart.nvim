vim.api.nvim_create_autocmd('FileType', {
  pattern = 'java',
  callback = function(args)
    print 'hello'
    require('jdtls.jdtls_setup').setup()
  end,
})
