#+------------------------------------------------------------------------------------------
# User Settings by Kelvin Philip
#+------------------------------------------------------------------------------------------
export DOTFILES=$HOME/.env
source $DOTFILES/.zshrc.local

if [ -f ".zshrc.local" ]
then
    source .zshrc.local
fi

#+------------------------------------------------------------------------------------------
