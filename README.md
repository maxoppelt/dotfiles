# Simple .dotfiles

## Usage
### The Lazy-Deep-Learner's cluster-function
Simple script to control a remote kubernetes/deep-learning cluster, without the need of connecting via ssh and manual kubectl control.
```
kubectl config set-context --current --namespace=<NAMESPACE>
```

## Installation
### Install macports
```
https://guide.macports.org/chunked/installing.html
```

Note: Speical versions
```
vim+cscope+huge+python38
```

### Install oh-my-zsh and p10k
Source/License: https://github.com/ohmyzsh/ohmyzsh, https://github.com/romkatv/powerlevel10k

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
```

### Install miniconda
```
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
chmod +x Miniconda3-latest-Linux-x86_64.sh
./Miniconda3-latest-Linux-x86_64.sh
```

### Move dofiles to home directory
Source/License (Some functions): https://github.com/mathiasbynens/dotfiles
```
mv .zshrc ~/
mv .zsh_profile ~/
mv .zsh_aliases ~/
mv .zsh_functions ~/
mv .zsh_cluster ~/
mv .zsh_secrets ~/
mv .gitconfig ~/
mv .gitignore ~/
mv .hushlogin ~/
mv .vim ~/
mv .vimrc ~/
mv .p10k.zsp10k.zshh ~/
```

Exit and reopen shell and setup vim
https://github.com/VundleVim/Vundle.vim
```
vim
Plugin Install -c
```

Call the init functions (to setup remote servers)
```
cluster init
```
