module_dotfiles() {
    git clone git@github.com:he-yaowen/dotfiles.git "$HOME"/.dotfiles

    cd "$HOME"/.dotfiles

    ./install.sh
}

module_python_pkgs() {
    "$python_pip" install virtualenv poetry pdm cookiecutter git-timemachine gitflux
}
