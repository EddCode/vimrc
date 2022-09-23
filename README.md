# Vim plugins 8.*

If you use vim8 you can clone this repo for get a some usefull plugins. You just clone the repository when you need.

This plugins use git-submodules to version-control.

#### Plugins
* [Ale](https://github.com/dense-analysis/ale)
* [NeerdTree](https://github.com/scrooloose/nerdtree)
* [Coc](https://github.com/neoclide/coc.nvim.git)
* [CloseTags](https://github.com/alvan/vim-closetag.git)
* [NeerdTree git](https://github.com/Xuyuanp/nerdtree-git-plugin.git)
* [Nerd Commenter](https://github.com/preservim/nerdcommenter.git)
* [Fugitive](https://github.com/tpope/vim-fugitive.git)
* [FZF](https://github.com/junegunn/fzf.vim.git)
* [Polyglot](https://github.com/sheerun/vim-polyglot.git)
* [Devicons](https://github.com/ryanoasis/vim-devicons.git)
* [Tmuxline](https://github.com/edkolev/tmuxline.vim.git)
* [Vim tmux](https://github.com/tmux-plugins/vim-tmux.git)
### Replicating the repository on a machine
- Clone the repository (_recursively_ to clone plugins as well):
	```bash
	  git clone --recursive https://github.com/EddCode/vimrc.git
	```

-  Now you must to create a Symlink to `.vim` and `.vimrc`:

	```bash
	 $ ln -sf reponame ~/.vim
	 $ ln -sf reponame/vimrc ~/.vimrc
	```

### Installing plugins
To install more plugins if you need (say always-loaded `foo` and optionally-loaded `bar`, located at `https://github.com/manasthakur/foo` and `https://github.com/manasthakur/bar`, respectively)
using Vim 8's package feature:

```bash
$ git submodule add https://github.com/manasthakur/foo.git pack/plugins/start/foo
$ git submodule add https://github.com/manasthakur/bar.git pack/plugins/opt/bar
$ git commit -m "Added submodules."
```

### Removing plugins
To remove `foo`:
```bash
$ cd ~/.vim
$ git submodule deinit pack/plugins/start/foo
$ git rm -r pack/plugins/start/foo
$ rm -r .git/modules/pack/plugins/start/foo
```

### Updating plugins
To update `foo`:
```bash
$ cd ~/.vim/pack/plugins/start/foo
$ git pull origin master
```

It is recommended to first `git fetch origin master` a plugin, review changes, and then `git merge`.

To update all the plugins:
```bash
$ cd ~/.vim
$ git submodule foreach git pull origin master
```

## Module fonts
This vim settings use [VimDevicons](https://github.com/ryanoasis/vim-devicons) to show icons in vim, however weather you wanted show icons
you need [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts), 'Couse it works with patched fonts

> See [configuration Nerd Fonts](https://github.com/ryanoasis/nerd-fonts#font-installation) for more information
