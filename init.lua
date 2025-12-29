-- (Assuming these files are in lua/config/...)
require 'config.options'
require 'config.keymaps'
require 'config.autocommands'

-- Load the plugin manager
require 'config.lazy'
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
