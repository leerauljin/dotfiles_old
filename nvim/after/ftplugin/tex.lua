local g = vim.g
local o = vim.o


g.vimtex_view_method = "sioyek"
g.vimtex_view_general_viewer = "sioyek"
g.tex_conceal = 'abdmg'
o.conceallevel = 2
o.spell=true
o.spelllang = 'en'
g.vimtex_toc_config = {
    mode = 1,
    fold_enable = 0,
    hide_line_numbers = 1,
    resize = 0,
    refresh_always = 1,
    show_help = 0,
    show_numbers = 1,
    split_pos = 'leftabove',
    split_width = 30,
    tocdeth = 3,
    indent_levels = 1,
    todo_sorted = 1,
}
