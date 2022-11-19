#!/usr/bin/env zsh

set -eu

STAGE="code"

source "${DOTFILES_PATH}"/src/*.zsh

require "code"

taskf "Install extensions"
extensions=(
  "bmewburn.vscode-intelephense-client"
  "dbaeumer.vscode-eslint"
  "EditorConfig.EditorConfig"
  "esbenp.prettier-vscode"
  "golang.Go"
  "MS-vsliveshare.vsliveshare-pack"
  "redhat.ansible"
  "redhat.vscode-yaml"
  "ryanolsonx.solarized"
  "timonwong.shellcheck"
)
for extension in ${extensions}
do
  code --install-extension "${extension}" || true # Ignore errors.
done

taskf "Link configuration files"
link "${DOTFILES_PATH}/modules/code/settings.json" "${HOME}/Library/Application Support/Code/User/settings.json"
link "${DOTFILES_PATH}/modules/code/snippets.code-snippets" "${HOME}/Library/Application Support/Code/User/snippets/snippets.code-snippets"
