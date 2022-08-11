module_darwin_brew() {
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

module_darwin_pkgs() {
    brew install coreutils gnu-sed gnu-tar findutils jq wget zsh python nodejs php lua
}
