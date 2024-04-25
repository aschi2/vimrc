stow:
  stow . --target=$HOME -v --dotfiles

unstow:
  stow -D . --target=$HOME -v --dotfiles

restow:
  stow -R . --target=$HOME -v --dotfiles

