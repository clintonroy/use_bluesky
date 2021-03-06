#!/bin/bash

# https://raw.githubusercontent.com/BCDA-APS/use_bluesky/master/starters/use_bluesky.sh

# start an interactive ipython session running BlueSky (from NSLS-II)
#
# usage:  use_bluesky.sh [profile_name]
#
#  Command Options
#     profile_name : name of existing ipython profile to use (default: $BLUESKY_PROFILE)
#
#  Environment Variable(s) (these are optional)
#     BLUESKY_BIN_DIR : absolute path to directory containing Python with BlueSky installed
#
#     The use_bluesky.sh script has default values for the environment variable(s).
#     BLUESKY_BIN_DIR__INTERNAL_DEFAULT : (the first of these to be found, in order)
#                                         "~/Apps/BlueSky/bin"
#                                         or "/APSshare/anaconda3/BlueSky/bin"
#                                         or "." (the fallback default if none of those are found)
#     BLUESKY_PROFILE__INTERNAL_DEFAULT : "bluesky"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# define the default path to the Python with BlueSky installed
export BLUESKY_BIN_DIR__INTERNAL_DEFAULT=.
if [ -d ~/Apps/BlueSky/bin ]; then
  export BLUESKY_BIN_DIR__INTERNAL_DEFAULT=~/Apps/BlueSky/bin
elif [ -d /APSshare/anaconda3/BlueSky/bin ]; then
  export BLUESKY_BIN_DIR__INTERNAL_DEFAULT=/APSshare/anaconda3/BlueSky/bin
  #export PYEPICS_LIBCA=/APSshare/anaconda3/BlueSky/lib/libca.so
fi


export BLUESKY_PROFILE__INTERNAL_DEFAULT=bluesky

# pick values to use, either from environment variables or defaults
export BLUESKY_BIN_DIR=${BLUESKY_BIN_DIR:-$BLUESKY_BIN_DIR__INTERNAL_DEFAULT}
export BLUESKY_PROFILE=${1:-$BLUESKY_PROFILE__INTERNAL_DEFAULT}


general_startup () {
    echo "BlueSky executable path: $BLUESKY_BIN_DIR"
    $BLUESKY_BIN_DIR/python --version
    $BLUESKY_BIN_DIR/conda --version
    $BLUESKY_BIN_DIR/pip --version
}


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

export PATH=${BLUESKY_BIN_DIR}:${PATH}

case "$1" in
    "")
        general_startup
        echo "starting ipython with profile: $BLUESKY_PROFILE"
        $BLUESKY_BIN_DIR/ipython --profile=$BLUESKY_PROFILE
        read -p "End of BlueSky console session - press return"
    ;;
    "-jupyter")
        general_startup
        echo "Starting jupyter-notebook"
        $BLUESKY_BIN_DIR/jupyter-notebook
        read -p "End of BlueSky console session - press return"
    ;;
    "-h" | --"help" | --"usage")
        echo "usage (one of these):"
        echo " use_bluesky.sh               # start with $BLUESKY_PROFILE__INTERNAL_DEFAULT as IPython profile"
        echo " use_bluesky.sh profile_name  # start with profile_name as IPython profile"
        echo " use_bluesky.sh -jupyter      # start a Jupyter notebook session"
        echo " use_bluesky.sh -h            # this help"
        echo " use_bluesky.sh --help        # this help"
        echo " use_bluesky.sh --usage       # this help"
    ;;
    *)
        general_startup
        echo "starting ipython with profile: $BLUESKY_PROFILE"
        $BLUESKY_BIN_DIR/ipython --profile=$BLUESKY_PROFILE
        read -p "End of BlueSky console session - press return"
    ;;
esac


