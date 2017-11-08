#!/bin/bash

# Packages for BlueSky, Ophyd, and related NSLS-II DAQ
# switch installation 
# from pip source GitHub master
# to conda channel lightsource2-tag

export PATH=~/Apps/BlueSky/bin:$PATH
BLUESKY_ROOT=$HOME/Apps/BlueSky
CONDA_CHANNELS=
CONDA_PKGS=
PIP_PKGS=

CONDA_CHANNELS+=" -c conda-forge"
CONDA_CHANNELS+=" -c defaults"
CONDA_CHANNELS+=" -c soft-matter"
CONDA_CHANNELS+=" -c lightsource2-tag"

CONDA_PKGS+=" amostra"
CONDA_PKGS+=" bluesky"
CONDA_PKGS+=" databroker"
CONDA_PKGS+=" doct"
CONDA_PKGS+=" event-model"
CONDA_PKGS+=" ophyd"
CONDA_PKGS+=" suitcase"
#CONDA_PKGS+=" hklpy"

PIP_PKGS+=" git+https://github.com/NSLS-II/amostra#egg=amostra"
PIP_PKGS+=" git+https://github.com/NSLS-II/bluesky#egg=bluesky"
PIP_PKGS+=" git+https://github.com/NSLS-II/databroker#egg=databroker"
PIP_PKGS+=" git+https://github.com/NSLS-II/doct#egg=doct"
PIP_PKGS+=" git+https://github.com/NSLS-II/event-model#egg=event_model"
PIP_PKGS+=" git+https://github.com/NSLS-II/ophyd#egg=ophyd"
PIP_PKGS+=" git+https://github.com/NSLS-II/suitcase#egg=suitcase"
#PIP_PKGS+=" git+https://github.com/NSLS-II/hklpy#egg=hklpy"

pip uninstall -y $PIP_PKGS
conda install -y  $CONDA_CHANNELS  $CONDA_PKGS
