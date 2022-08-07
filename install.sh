#!/usr/bin/env bash

set -e

base_dir=$(dirname "$(realpath "$0")")
source "$base_dir"/functions.sh

config_dir="$base_dir"/config
module_dir="$base_dir"/modules

source "$config_dir/$OSTYPE".conf
source "$module_dir"/common.sh
source "$module_dir/$OSTYPE".sh

for module in "${modules[@]}"; do
    if is_module_installed "$module"; then
        continue
    fi

    install_module "$module"
done
