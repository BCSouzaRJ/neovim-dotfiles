-- lua/dashboard.lua

local M = {}

-- =========================================
-- HEADER
-- =========================================
local header = {
    '',
    '',
    '',
    '',
    '   ▄▄▄▄▀ █▄▄▄▄ ██      ▄      ▄▄▄▄▄       █▄▄▄▄ ▄█   ▄▀   ▄  █    ▄▄▄▄▀ ▄▄▄▄▄   ',
    '▀▀▀ █    █  ▄▀ █ █      █    █     ▀▄     █  ▄▀ ██ ▄▀    █   █ ▀▀▀ █   █     ▀▄ ',
    '    █    █▀▀▌  █▄▄█ ██   █ ▄  ▀▀▀▀▄       █▀▀▌  ██ █ ▀▄  ██▀▀█     █ ▄  ▀▀▀▀▄   ',
    '   █     █  █  █  █ █ █  █  ▀▄▄▄▄▀        █  █  ▐█ █   █ █   █    █   ▀▄▄▄▄▀    ',
    '  ▀        █      █ █  █ █                  █    ▐  ███     █    ▀              ',
    '          ▀      █  █   ██                 ▀               ▀                    ',
    '                ▀                                                               ',
}

-- =========================================
-- CENTRALIZAR TEXTO
-- =========================================
local function center(str, width)
    local pad = math.floor((width - vim.fn.strdisplaywidth(str)) / 2)
    return string.rep(' ', math.max(pad, 0)) .. str
end

-- =========================================
-- PICKER DE PROJETOS
-- =========================================
local function open_project_picker()
    local telescope = require('telescope')
    local pickers = require('telescope.pickers')
    local finders = require('telescope.finders')
    local conf = require('telescope.config').values
    local actions = require('telescope.actions')
    local action_state = require('telescope.actions.state')
    local themes = require('telescope.themes')

    local project_dir = vim.fn.expand('~/Projetos')

    local projects = {}

    local handle = vim.loop.fs_scandir(project_dir)

    if handle then
        while true do
            local name, typ = vim.loop.fs_scandir_next(handle)

            if not name then
                break
            end

            if typ == 'directory' then
                table.insert(projects, name)
            end
        end
    end

    table.sort(projects)

    pickers.new(themes.get_dropdown({
        previewer = false,
        winblend = 10,
        width = 0.55,
        height = 0.45,
        prompt_title = ' Projetos ',
    }), {

        finder = finders.new_table({
            results = projects,
        }),

        sorter = conf.generic_sorter({}),

        attach_mappings = function(prompt_bufnr)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)

                local selection = action_state.get_selected_entry()

                if not selection then
                    return
                end

                local full_path = project_dir .. '/' .. selection[1]

                -- fecha dashboard
                vim.cmd('silent! %bd')

                -- muda diretório
                vim.cmd('cd ' .. vim.fn.fnameescape(full_path))

                -- abre explorer
                vim.cmd('Ex')
            end)

            return true
        end,
    }):find()
end

-- =========================================
-- BOTÕES
-- =========================================
local buttons = {
    { '  Projetos', 'p', open_project_picker },
    { '󰈔  Novo arquivo', 'n', ':enew<CR>' },
    { '󰱼  Buscar arquivo', 'f', ':Telescope find_files<CR>' },
    { '󰊄  Buscar texto', 'g', ':Telescope live_grep<CR>' },
    { '󰁯  Recentes', 'r', ':Telescope oldfiles<CR>' },
    { '󰒲  Lazy', 'l', ':Lazy<CR>' },
    { '󰩈  Sair', 'q', ':qa<CR>' },
}

-- =========================================
-- OPEN DASHBOARD
-- =========================================
function M.open()
    -- não abrir se passou arquivo
    if vim.fn.argc() > 0 then
        return
    end

    local buf = vim.api.nvim_create_buf(false, true)

    vim.api.nvim_set_current_buf(buf)

    -- opções buffer
    vim.bo[buf].buftype = 'nofile'
    vim.bo[buf].bufhidden = 'wipe'
    vim.bo[buf].swapfile = false
    vim.bo[buf].modifiable = true
    vim.bo[buf].filetype = 'dashboard'

    -- opções janela
    vim.wo.number = false
    vim.wo.relativenumber = false
    vim.wo.cursorline = false
    vim.wo.signcolumn = 'no'
    vim.wo.foldcolumn = '0'
    vim.wo.list = false

    local width = vim.o.columns
    local lines = {}

    -- HEADER
    for _, line in ipairs(header) do
        table.insert(lines, center(line, width))
    end

    table.insert(lines, '')
    table.insert(lines, '')

    -- BOTÕES
    local button_lines = {}

    for _, button in ipairs(buttons) do
        local label = '  [' .. button[2] .. ']  ' .. button[1] .. '  '

        table.insert(lines, center(label, width))

        table.insert(button_lines, #lines)

        table.insert(lines, '')
    end

    -- escreve buffer
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

    vim.bo[buf].modifiable = false

    -- =========================================
    -- HIGHLIGHTS
    -- =========================================
    local ns = vim.api.nvim_create_namespace('dashboard')

    -- header
    for i = 1, #header do
        vim.api.nvim_buf_add_highlight(
            buf,
            ns,
            'Function',
            i - 1,
            0,
            -1
        )
    end

    -- botões
    for _, line in ipairs(button_lines) do
        vim.api.nvim_buf_add_highlight(
            buf,
            ns,
            'Keyword',
            line - 1,
            0,
            -1
        )
    end

    -- =========================================
    -- KEYMAPS
    -- =========================================
    for _, button in ipairs(buttons) do
        local key = button[2]
        local action = button[3]

        if type(action) == 'string' then
            vim.keymap.set('n', key, action, {
                buffer = buf,
                silent = true,
                nowait = true,
            })
        else
            vim.keymap.set('n', key, action, {
                buffer = buf,
                silent = true,
                nowait = true,
            })
        end
    end

    -- impede edição acidental
    vim.keymap.set('n', 'i', '<Nop>', { buffer = buf })
    vim.keymap.set('n', 'a', '<Nop>', { buffer = buf })
    vim.keymap.set('n', 'o', '<Nop>', { buffer = buf })

    -- cursor invisível
    vim.opt_local.guicursor = 'a:Invisible'

    -- ESC limpa highlight
    vim.keymap.set('n', '<Esc>', ':noh<CR>', {
        buffer = buf,
        silent = true,
    })
end

return M
