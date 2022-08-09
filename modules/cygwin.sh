module_cygwin_init() {
    for skel in /etc/skel/.*; do
        test -f "$skel" && cp -n "$skel" "$HOME"
    done

	cp "$base_dir"/config/cygwin/.minttyrc "$HOME"
}

module_cygwin_apt-cyg() {
    git clone https://github.com/transcode-open/apt-cyg.git /usr/local/apt-cyg

    ln -s /usr/local/apt-cyg/apt-cyg /usr/local/bin

    apt-cyg cache /var/cache/cygwin
    apt-cyg mirror $cygwin_mirror_url
}
