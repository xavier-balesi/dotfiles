-- [[ filetype association ]]

-- Jenkinsfile
local au_id = vim.api.nvim_create_augroup('jenkins-groovy', { clear = true })
vim.api.nvim_create_autocmd(
    { "BufNewFile", "BufRead" }, {
        pattern = { "Jenkinsfile*" },
        command = [[ setf groovy ]],
        group = au_id,
    })
--
-- Dockerfile
local au_id = vim.api.nvim_create_augroup('dockerfile', { clear = true })
vim.api.nvim_create_autocmd(
    { "BufNewFile", "BufRead" }, {
        pattern = { "Dockerfile*" },
        command = [[ setf dockerfile ]],
        group = au_id,
    })

-- bashrc
local au_id = vim.api.nvim_create_augroup('bashrc-filetype', { clear = true })
vim.api.nvim_create_autocmd(
    { "BufNewFile", "BufRead" }, {
        pattern = {
            "*.bashrc",
        },
        command = [[ setf bash ]],
        group = au_id,
    }
)

-- helm
local au_id = vim.api.nvim_create_augroup('helm-filetype', { clear = true })
vim.api.nvim_create_autocmd(
    { "BufNewFile", "BufRead" }, {
        pattern = {
            "*.yaml.gotmpl",
            "*/helmfile.d/*.yaml",
            "*/helmfile.d/**/*.gotmpl",
            "*/templates/*/*.yml",
            "*/templates/**/*.yml",
            "*/templates/*/*.yaml",
            "*/templates/**/*.yaml"
        },
        callback = function()
            vim.opt_local.filetype = 'helm'
            vim.opt_global.filetype = 'helm'
        end,
        -- command = [[ setf helm ]],
        group = au_id,
    }
)
