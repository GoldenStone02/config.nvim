GOLANG_VERSION=1.24.4

wget https://go.dev/dl/go$GOLANG_VERSION.linux-amd64.tar.gz -O /tmp/go$GOLANG_VERSION.linux-amd64
tar -C ~/.local -xf /tmp/go$GOLANG_VERSION.linux-amd64
ln -sf $(readlink -f ~/.local/go/bin/go) ~/.local/bin/go

export PATH=$HOME/.local/go/bin:$PATH
