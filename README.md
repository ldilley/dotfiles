# dotfiles
This repository contains various editor, shell, and other program configuration files. Since git is distributed, this
allows me to easily retrieve my config files from other systems that I work on. If you find any of these files useful,
then enjoy!

Recommended:
* vim or neovim
* ctags
* [gitgutter](https://github.com/airblade/vim-gitgutter)
* [supertab](https://github.com/ervandew/supertab)
* [git-prompt](https://github.com/olemb/git-prompt)
* [Oh my tmux!](https://github.com/gpakosz/.tmux)

Example to generate ctags:
1. `mkdir -p ~/.vim/tags`
2. `ctags -f ~/.vim/tags/c.tags -h ".h" -R --c-kinds=+p --fields=+iaS --extra=+q /usr/include`
