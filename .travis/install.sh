#!/usr/bin/env bash

set -e
set -x

if [[ $TRAVIS == true ]]; then
    if [[ "$(uname -s)" == 'Darwin' ]]; then
        brew update || brew update
        brew outdated pyenv || brew upgrade pyenv
        brew install pyenv-virtualenv
        brew install cmake || true

        # brew tap caskroom/versions
        brew cask install java
        brew cask install arduino

        if which pyenv > /dev/null; then
            eval "$(pyenv init -)"
        fi

        pyenv install 2.7.10
        pyenv virtualenv 2.7.10 conan
        pyenv rehash
        pyenv activate conan
    fi
fi

pip install git+https://github.com/anton-matosov/conan.git --upgrade
pip install git+https://github.com/anton-matosov/conan_package_tools.git


conan user

