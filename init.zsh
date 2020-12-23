#!/bin/zsh

if [  -d "${ZDOTDIR:-$HOME}/.zprezto" ];then
    rm -rf "${ZDOTDIR:-$HOME}/.zprezto"
fi
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"


setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    rm -rf "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done


echo "--script-----------------------------"
SCRIPT_DIR=$(cd $(dirname $0); pwd)
SCRIPT_DIR="${ZDOTDIR:-$HOME}"/zsh_setting
echo $SCRIPT_DIR


echo "--write-----------------------------------"

echo  "source ${SCRIPT_DIR}/.zshenv"  >> "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/zshenv;
echo  "source ${SCRIPT_DIR}/.zprofile"  >> "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/zprofile;
echo  "source ${SCRIPT_DIR}/.zshrc"  >> "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/zshrc;


echo "--sorce-----------------------------------"
source "${ZDOTDIR:-$HOME}"/.zshenv
source "${ZDOTDIR:-$HOME}"/.zprofile
source "${ZDOTDIR:-$HOME}"/.zshrc

