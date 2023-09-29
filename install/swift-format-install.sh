#!/usr/bin/env bash

# install Nick Lockwood's SwiftFormat

set -o errexit

has_command () {
    command -v "$1" > /dev/null
}

if ! has_command "swiftformat" ; then
    echo "-------- swiftformat already installed. Will skip re-installation."
    exit 0
fi

if has_command "wget" ; then
    echo "-------- wget already installed. That's nice!"
    exit 0
elif
    echo "-------- Will install wget"
    apt update -y
    apt install wget -y
    echo "-------- wget installation successful"
fi

wget --retry-connrefused https://github.com/MahdiBM/swift-format-repo/raw/main/executables/swiftformat-0.54.2-linux-arm64.deb -o swiftformat-0.54.2.deb
dpkg -i ./swiftformat-0.54.2.deb
rm ./swiftformat-0.54.2.deb
