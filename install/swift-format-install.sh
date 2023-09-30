#!/usr/bin/env bash

# install Nick Lockwood's SwiftFormat

set -o errexit

has_command () {
    command -v "$1" > /dev/null
}

print () {
    echo -n "---------------- "
    echo $1
}

dpkg -i ~/swift-format-repo/executables/swiftformat-0.54.2-linux-arm64.deb

if has_command "swiftformat" ; then
    print "swiftformat installation successful"
else
    print "could not install swiftformat"
fi
