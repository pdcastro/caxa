#!/usr/bin/env bash

set -ex

rm -f stub--*
BIN=stub--win32--x64;    GOOS=windows GOARCH=amd64 CGO_ENABLED=0 go build -o $BIN stub.go && echo >> $BIN && echo "CAXACAXACAXA" >> $BIN
BIN=stub--darwin--x64;   GOOS=darwin  GOARCH=amd64 CGO_ENABLED=0 go build -o $BIN stub.go && echo >> $BIN && echo "CAXACAXACAXA" >> $BIN
BIN=stub--darwin--arm64; GOOS=darwin  GOARCH=arm64 CGO_ENABLED=0 go build -o $BIN stub.go && echo >> $BIN && echo "CAXACAXACAXA" >> $BIN
BIN=stub--linux--x64;    GOOS=linux   GOARCH=amd64 CGO_ENABLED=0 go build -o $BIN stub.go && echo >> $BIN && echo "CAXACAXACAXA" >> $BIN
BIN=stub--linux--arm64;  GOOS=linux   GOARCH=arm64 CGO_ENABLED=0 go build -o $BIN stub.go && echo >> $BIN && echo "CAXACAXACAXA" >> $BIN
BIN=stub--linux--arm;    GOOS=linux   GOARCH=arm   CGO_ENABLED=0 go build -o $BIN stub.go && echo >> $BIN && echo "CAXACAXACAXA" >> $BIN
# BIN=stub--linux--arm--6; GOOS=linux GOARCH=arm GOARM=6 CGO_ENABLED=0 go build -o $BIN stub.go && echo >> $BIN && echo "CAXACAXACAXA" >> $BIN
# BIN=stub--linux--arm--7; GOOS=linux GOARCH=arm GOARM=7 CGO_ENABLED=0 go build -o $BIN stub.go && echo >> $BIN && echo "CAXACAXACAXA" >> $BIN

git tag -afm "" v2.1.0 HEAD
git push --tags --force pdcastro
# gh release create -R pdcastro/caxa -n "" -t v2.1.0 v2.1.0 stub--*
gh release upload -R pdcastro/caxa --clobber v2.1.0 stub--*
