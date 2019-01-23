#! /usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

STABLE_RELEASE="v1.3"
DEV_RELEASE=
SRC_PATH=${HOME}

git_download() {
    git clone https://github.com/Sunhick/dotfiles.git ${SRC_PATH}/.dotfiles/dotfiles
    git checkout ${STABLE_RELEASE}
}

wget_download() {
    wget https://github.com/Sunhick/dotfiles/archive/${STABLE_RELEASE}.tar.gz -o ${SRC_PATH}/.dotfiles/dotfiles
}

curl_download() {
    # figure out curl CLI for dowloading
}

download() {
    # For now let's just assume that user has installed git.
    # wget and curl to be implemented.
    git_download
}

install() {
    # install the dotfiles using stow
    (
        cd ${SRC_PATH}
        stow emacs zsh tmux nano --target ${HOME}
    )
}

download && install