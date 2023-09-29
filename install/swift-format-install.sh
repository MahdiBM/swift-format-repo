#!/usr/bin/env bash

# install Nick Lockwood's SwiftFormat

set -o errexit

has_command () {
    command -v "$1" > /dev/null
}

print () {
    echo "$1"
    echo ""
}

if has_command "swiftformat" ; then
    print "-------- swiftformat already installed. Will skip re-installation."
    exit 0
fi

if has_command "wget" ; then
    print "-------- wget already installed. That's nice!"
else
    print "-------- Will install wget"
    apt update -y
    apt install wget -y
    print "-------- wget installation successful"
fi

wget --retry-connrefused -O swiftformat-0.54.2.deb https://github.com/MahdiBM/swift-format-repo/raw/main/executables/swiftformat-0.54.2-linux-arm64.deb
dpkg -i swiftformat-0.54.2.deb

print "-------- 'swiftformat' installation successful"
