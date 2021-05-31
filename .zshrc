#+------------------------------------------------------------------------------------------
# User Settings by Kelvin Philip
#+------------------------------------------------------------------------------------------
#
#    | | ___ __    _______| |__  _ __ ___
#    | |/ / '_ \  |_  / __| '_ \| '__/ __|
#    |   <| |_) |  / /\__ \ | | | | | (__
#    |_|\_\ .__/  /___|___/_| |_|_|  \___|
#         |_|
#
#+------------------------------------------------------------------------------------------


#+------------------------------------------------------------------------------------------
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#+------------------------------------------------------------------------------------------
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


#+------------------------------------------------------------------------------------------
export DOTFILES=$HOME/.env
source $DOTFILES/.zshrc.local

if [ -f $HOME/.zshrc.local ]
then
    source $HOME/.zshrc.local
fi


#+------------------------------------------------------------------------------------------
