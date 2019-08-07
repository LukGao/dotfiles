
wget https://dl.google.com/go/go1.12.7.linux-amd64.tar.gz
tar -xzf go1.12.7.linux-amd64.tar.gz
mv go /usr/local
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
mkdir $HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
go env

export GO111MODULE=on
export GOPROXY=https://goproxy.io
#export GOPROXY=https://mirrors.aliyun.com/goproxy/

go install github.com/go-delve/delve/cmd/dlv
go install github.com/kisielk/errcheck
go install github.com/davidrjenni/reftools/cmd/fillstruct
go install github.com/mdempsky/gocode
go install github.com/stamblerre/gocode
go install github.com/rogpeppe/godef
go install github.com/zmb3/gogetdoc
go install golang.org/x/tools/cmd/goimports
go install golang.org/x/lint/golint
go install golang.org/x/tools/gopls
go install github.com/alecthomas/gometalinter
go install github.com/golangci/golangci-lint/cmd/golangci-lint
go install github.com/fatih/gomodifytags
go install golang.org/x/tools/cmd/gorename
go install github.com/jstemmer/gotags
go install golang.org/x/tools/cmd/guru
go install github.com/josharian/impl
go install honnef.co/go/tools/cmd/keyify
go install github.com/fatih/motion
go install github.com/klauspost/asmfmt/cmd/asmfmt
go install github.com/koron/iferr
