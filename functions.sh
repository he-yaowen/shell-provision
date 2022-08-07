installed_modules="$base_dir"/.installed_modules

if [[ $OSTYPE == "darwin"* ]]; then
    OSTYPE=darwin
fi

exit_fatal() {
    echo "fatal: $1" >&2
    exit 1
}

is_module_defined() {
    type module_"$1" > /dev/null 2> /dev/null

    return $?
}

is_module_installed() {
    grep "$1" "$installed_modules" > /dev/null 2> /dev/null

    return $?
}

install_module() {
    if ! is_module_defined "$1"; then
        exit_fatal "Module '$1' not defined."
    fi

    module_"$1"

    echo "$1" >> "$installed_modules"
}
