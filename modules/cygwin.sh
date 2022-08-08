module_cygwin_init() {
    for skel in /etc/skel/.*; do
        test -f "$skel" && cp -n "$skel" "$HOME"
    done

	cp "$base_dir"/config/cygwin/.minttyrc "$HOME"
}
