-- lua/dashboard.lua
local M = {}

-- seu header
local header = {
    '','','','',
    '   ▄▄▄▄▀ █▄▄▄▄ ██      ▄      ▄▄▄▄▄       █▄▄▄▄ ▄█   ▄▀   ▄  █    ▄▄▄▄▀ ▄▄▄▄▄   ',
    '▀▀▀ █    █  ▄▀ █ █      █    █     ▀▄     █  ▄▀ ██ ▄▀    █   █ ▀▀▀ █   █     ▀▄ ',
    '    █    █▀▀▌  █▄▄█ ██   █ ▄  ▀▀▀▀▄       █▀▀▌  ██ █ ▀▄  ██▀▀█     █ ▄  ▀▀▀▀▄   ',
    '   █     █  █  █  █ █ █  █  ▀▄▄▄▄▀        █  █  ▐█ █   █ █   █    █   ▀▄▄▄▄▀    ',
    '  ▀        █      █ █  █ █                  █    ▐  ███     █    ▀              ',
    '          ▀      █  █   ██                 ▀               ▀                    ',
    '                ▀                                                               ',
}

-- botões: { ícone + label, tecla, ação }
local buttons = {
    { '󰈔  Novo arquivo', 'n', ':enew<CR>' },
    { '󰱼  Buscar arquivo', 'f', ':Telescope find_files<CR>' },
    { '󰊄  Buscar no projeto', 'g', ':Telescope live_grep<CR>' },
    { '󰁯  Recentes', 'r', ':Telescope oldfiles<CR>' },
    { '󰒲  Lazy', 'l', ':Lazy<CR>' },
    { '󰩈  Sair', 'q', ':qa<CR>' },
}

local function center(str, width)
    local pad = math.floor((width - vim.fn.strdisplaywidth(str)) / 2)
    return string.rep(' ', pad) .. str
end

function M.open()
    -- só abre se não tiver arquivo aberto
    if vim.fn.argc() > 0 then return end

    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_set_current_buf(buf)

    -- opções do buffer
    vim.bo[buf].buftype    = 'nofile'
    vim.bo[buf].bufhidden  = 'wipe'
    vim.bo[buf].modifiable = true
    vim.bo[buf].swapfile   = false

    local width            = vim.o.columns
    local lines            = {}

    -- adiciona header centralizado
    for _, line in ipairs(header) do
        table.insert(lines, center(line, width))
    end

    -- adiciona linha em branco antes dos botões
    table.insert(lines, '')

    -- guarda em quais linhas ficam os botões (pra highlight)
    local button_lines = {}
    for _, button in ipairs(buttons) do
        local label = '  [' .. button[2] .. ']  ' .. button[1] .. '  '
        local centered = center(label, width)
        table.insert(lines, centered)
        table.insert(button_lines, #lines)
        table.insert(lines, '') -- espaçamento entre botões
    end

    -- escreve no buffer
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
    vim.bo[buf].modifiable = false

    -- highlight do header
    local ns = vim.api.nvim_create_namespace('dashboard')
    for i = 1, #header do
        vim.api.nvim_buf_add_highlight(buf, ns, 'Function', i - 1, 0, -1)
    end

    -- highlight dos botões
    for _, lnum in ipairs(button_lines) do
        vim.api.nvim_buf_add_highlight(buf, ns, 'Keyword', lnum - 1, 0, -1)
    end

    -- keymaps dos botões
    for _, button in ipairs(buttons) do
        vim.keymap.set('n', button[2], button[3], { buffer = buf, silent = true })
    end

    -- esconde cursor e número de linha
    vim.wo.number         = false
    vim.wo.relativenumber = false
    vim.wo.cursorline     = false
    vim.wo.signcolumn     = 'no'
end

return M
