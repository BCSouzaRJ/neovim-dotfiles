-- ~/.config/nvim/lsp/angularls.lua
local mason_path = vim.fn.stdpath("data") .. "/mason/packages/angular-language-server"
local ngserver   = mason_path .. "/node_modules/.bin/ngserver"
local project_ts = vim.fn.getcwd() .. "/node_modules/typescript/lib"
local global_ts  = mason_path .. "/node_modules/typescript/lib"

return {
    cmd = {
        ngserver,
        "--stdio",
        "--tsProbeLocations", project_ts .. "," .. global_ts,
        "--ngProbeLocations", mason_path .. "/node_modules/@angular/language-server/node_modules",
    },
    filetypes = { "typescript", "html", "typescriptreact", "angular" },
    root_markers = { "angular.json", "project.json", ".git" },
    on_new_config = function(new_config)
        local ts_local = vim.fn.getcwd() .. "/node_modules/typescript/lib"
        new_config.cmd = {
            ngserver,
            "--stdio",
            "--tsProbeLocations", ts_local .. "," .. global_ts,
            "--ngProbeLocations", mason_path .. "/node_modules/@angular/language-server/node_modules",
        }
    end,
}
