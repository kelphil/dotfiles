#!/usr/bin/env bash

#
# .cshrc Micron R&D Network Shell startup file
# Initial release: 12/19/2004
#
# Source Micron standard .cshrc file
#vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
source /cde/prod/SM/setup/.cshrc.cde
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
# End of Micron standard .cshrc file
#
# Insert  your personal definitions of variables and aliases below.
# For help, go to webpage below:
#  http://rndweb.micron.com/tools/enviro/designEnv/
#vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv


#+------------------------------------------------------------------------------------------
# User Settings by Kelvin Philip
#+------------------------------------------------------------------------------------------
export DOTFILES=$HOME/.env
source $DOTFILES/.cshrc.local

#+------------------------------------------------------------------------------------------
