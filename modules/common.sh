module_dotfiles() {
    git clone git@github.com:he-yaowen/dotfiles.git "$HOME"/.dotfiles

    cd "$HOME"/.dotfiles

    ./install.sh
}
