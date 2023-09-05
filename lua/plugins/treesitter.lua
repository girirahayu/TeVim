local status, treesitter = pcall(require, "nvim-treesitter.configs")

if not status then
    return
end

require("nvim-treesitter.install").compilers = { "clang" }

treesitter.setup({
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'org' },
        use_languagetree = true,
    },
    -- Playground
    playground = {
        enable = true,
        disable = {},
        updatetime = 25,
        persist_queries = false,
        keybindings = {
            toggle_query_editor = 'o',
            toggle_hl_groups = 'i',
            toggle_injected_languages = 't',
            toggle_anonymous_nodes = 'a',
            toggle_language_display = 'I',
            focus_language = 'f',
            unfocus_language = 'F',
            update = 'R',
            goto_node = '<cr>',
            show_help = '?',
        },
    },
    query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = { "BufWrite", "CursorHold" },
    },
    -- Rainbow
    rainbow = { enable = true },
    -- Indent
    indent = { enable = true },
    -- Autotag
    autotag = { enable = true },
    -- Autopairs
    autopairs = { enable = true },
    -- Auto install
    ensure_installed = { "lua" },
    auto_install = true,
    sync_install = false,
})
