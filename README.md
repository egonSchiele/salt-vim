# salty-vim

Adds syntax highlighting and indent support for Salty in vim.

Add to your vimrc:

```
autocmd BufNewFile,BufRead *.salt set filetype=salt
autocmd BufEnter *.salt colorscheme default
```

Install using Vundle:

```
Plugin 'egonschiele/salt-vim'
```
