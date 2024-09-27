require "before"
require "packages"
require "after"

        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        local api = require('typescript-tools.api')
        local noremap = { noremap = true, silent = true }
        local wk = require('which-key');

        wk.register({
            -- FILE
            ['<leader>'] = {
                c = {
                    name = "[C]ode",
                    m = { ':TSToolsAddMissingImports<CR>', noremap, "add [M]issing imports" },
                    r = { ':TSToolsRemoveUnused<CR>',  noremap, "[R]emove unused variables" } ,
                    x = { ':TSToolsRemoveUnusedImports<CR>',noremap, "[R]emove unused [I]mports"  },
                    d = { ':TSToolsGoToSourceDefinition<CR>', noremap, "go to [D]efinition"  },
                    o = { ':TSToolsOrganizeImports<CR>',  noremap,"[O]rganize imports"  },
                    s = { ':TSToolsSortImports<CR>',  noremap,"[S]ort imports"  },
                    f = { ':TSToolsFixAll<CR>', noremap, "[F]ix all"  },
                }
            }
        })
        require('typescript-tools').setup({
            capabilities = capabilities,
            settings = {
                separate_diagnostic_server = true,
                publish_diagnostic_on = 'insert_leave',
                expose_as_code_action = { 'fix_all', 'add_missing_imports', 'remove_unused' },
                tsserver_max_memory = 'auto',
            },
            handlers = {
                ['textDocument/publishDiagnostics'] = api.filter_diagnostics(
                -- Ignore 'This may be converted to an async function' diagnostics.
                    { 80001 }
                ),
            },
        })


