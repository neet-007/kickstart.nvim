local M = {}

function M.setup()
  local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

  -- Isolated workspace directory
  local workspace_dir = vim.fn.stdpath 'data' .. '/jdtls-workspace/' .. project_name
  print(workspace_dir)

  local config = {
    -- Launch using the system 'jdtls' command (Mason puts this in your path)
    cmd = {
      vim.fn.stdpath 'data' .. '/mason/bin/jdtls',
      '-data',
      workspace_dir,
      '--jvm-arg=-Xmx1G',
    },

    -- Root markers to find your project base
    root_dir = vim.fs.root(0, { '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle' }),

    settings = {
      java = {
        configuration = {
          runtimes = {
            {
              name = 'JavaSE-18',
              path = '/usr/lib/jvm/java-18-openjdk-amd64/', -- Your project version
              default = true,
            },
            {
              name = 'JavaSE-21',
              path = '/usr/lib/jvm/java-21-openjdk-amd64/', -- Required to run JDTLS
            },
          },
        },
        -- Enable useful features
        signatureHelp = { enabled = true },
        contentProvider = { preferred = 'fernflower' },
        completion = {
          favoriteStaticMembers = {
            'org.junit.Assert.*',
            'org.junit.jupiter.api.Assertions.*',
            'java.util.Objects.requireNonNull',
          },
        },
      },
    },

    -- Capabilities for blink.cmp or similar
    capabilities = require('blink.cmp').get_lsp_capabilities(),
  }

  -- Start or attach the server
  require('jdtls').start_or_attach(config)
end

return M
