local venv_python = vim.fn.getcwd() .. "/.venv/bin/python"

return {
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_markers = {
        "pyproject.toml", "setup.py", "setup.cfg",
        "requirements.txt", "Pipfile", "pyrightconfig.json",
    },
    settings = {
        python = {
            pythonPath = vim.fn.executable(venv_python) == 1
                and venv_python
                or vim.fn.exepath("python3"),
        },
    },
}
