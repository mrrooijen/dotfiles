let trim_blacklist = ["md", "markdown"]
autocmd BufWritePre * if index(trim_blacklist, &ft) < 0 | :%s/\s\+$//e
autocmd Bufread,BufNewFile {*.md} set filetype=markdown
autocmd BufRead,BufNewFile *.eco set ft=html
