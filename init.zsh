#!/usr/bin/env zsh
set -eu

STAGE="init"

source "${PWD}"/src/*.zsh

xcode-select --print-path &> /dev/null
if [[ ${?} != 0 ]] {
  taskf "Install Xcode Command Line Tools"
  xcode-select --install
}

require "brew" &> /dev/null
if [[ ${?} != 0 ]] {
  taskf "Install Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"    
}

