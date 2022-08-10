module_dotfiles() {
    git clone git@github.com:he-yaowen/dotfiles.git "$HOME"/.dotfiles

    cd "$HOME"/.dotfiles

    ./install.sh
}

module_python_pkgs() {
    "$python_pip" install virtualenv poetry pdm cookiecutter git-timemachine gitflux
}

module_oh-my-zsh() {
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/' "$HOME"/.zshrc
}
