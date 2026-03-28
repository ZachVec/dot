# 开启代理
proxy_on() {
    export http_proxy="http://127.0.0.1:7890"
    export https_proxy="http://127.0.0.1:7890"
    echo "Proxy enabled. http://127.0.0.1:7890"
}

# 关闭代理
proxy_off() {
    unset http_proxy
    unset https_proxy
    echo "Proxy disabled."
}

