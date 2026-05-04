proxy_on() {
    export http_proxy="http://127.0.0.1:7890"
    export https_proxy="http://127.0.0.1:7890"
    export all_proxy="http://127.0.0.1:7890"
    export HTTP_PROXY="http://127.0.0.1:7890"
    export HTTPS_PROXY="http://127.0.0.1:7890"
    export ALL_PROXY="http://127.0.0.1:7890"
    export no_proxy="localhost,127.0.0.1,::1,.local"
    export NO_PROXY="localhost,127.0.0.1,::1,.local"
    echo "Proxy enabled. http://127.0.0.1:7890"
}

proxy_off() {
    unset http_proxy https_proxy all_proxy
    unset HTTP_PROXY HTTPS_PROXY ALL_PROXY
    unset no_proxy NO_PROXY
    echo "Proxy disabled."
}

papt() {
    apt -o "Acquire::http::proxy=http://127.0.0.1:7890" -o "Acquire::https::proxy=http://127.0.0.1:7890" "$@"
}
