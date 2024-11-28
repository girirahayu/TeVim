-- return {
-- 	highlight = {
-- 		enable = true,
-- 		use_languagetree = true,
-- 	},
-- 	indent = { enable = true },
-- 	ensure_installed = { "lua", "vim", "vimdoc" },
-- 	auto_install = true,
-- }
return {
    highlight = {
        enable = true,
        use_languagetree = true, -- Enables syntax tree for highlighting
    },
    indent = {
        enable = true, -- Enables Treesitter-based indentation
    },
    ensure_installed = {
        "lua", "vim", "vimdoc", "python", "javascript", "typescript", "html", "css", "go", "cpp", "java",
        "ruby", "json", "markdown", "rust", "php", "yaml", "bash", "sql", "svelte", "vue", "xml", "cpp",
    },
    auto_install = true, -- Automatically install missing parsers
    textobjects = {
        select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to text objects
        },
        move = {
            enable = true,
            set_jumps = true, -- Maintain cursor position when moving
        },
    },
}

