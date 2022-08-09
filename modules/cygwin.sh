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

module_cygwin_python() {
    apt-cyg install python39 python39-devel python39-pip
    ln -sf /usr/bin/python3.9.exe /usr/bin/python3
    ln -sf /usr/bin/python3.9.exe /usr/bin/python
    ln -sf /usr/bin/pip3.9 /usr/bin/pip
}

module_cygwin_lua() {
    apt-cyg install gcc-core make lua liblua-devel liblua5.3 unzip

    # luarocks
    ln -sf /usr/lib/liblua5.3.dll.a /usr/lib/liblua.a
    ln -sf /usr/include/lua5.3 /usr/include/lua

    curl https://luarocks.org/releases/luarocks-3.9.2.tar.gz -o /tmp/luarocks-3.9.2.tar.gz

    cd /tmp/
    tar xf luarocks-3.9.2.tar.gz
    cd luarocks-3.9.2
    ./configure
    make
    make install

    # luaenv
    git clone https://github.com/cehoffman/luaenv.git ~/.luaenv
    cd ~/.luaenv

    git clone https://github.com/cehoffman/lua-build.git ~/.luaenv/plugins/lua-build

    echo 'export PATH="$HOME/.luaenv/bin:$PATH"' >> "$SHELL_PROFILE"
    echo 'eval "$(luaenv init -)"' >> "$SHELL_PROFILE"
}

module_cygwin_php() {
       apt-cyg install php php-{ctype,curl,devel,fileinfo,gd,gettext,iconv,json,mbstring,pdo_mysql,pdo_sqlite,phar,simplexml,tokenizer,xmlreader,xmlwriter}
}
