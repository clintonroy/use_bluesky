# Templates

Files and directories here are templates for installation.

It is assumed you have already
[created a custom conda environment](/python_installation/README.md#quick-summary)
for your use of the Bluesky framework.

CONTENTS

- [Templates](#templates)
- [Install instrument package](#install-instrument-package)
  - [independent package installed into python environment](#independent-package-installed-into-python-environment)
    - [Download & Installation](#download--installation)
  - [ipython profile configuration](#ipython-profile-configuration)
    - [Download & Installation](#download--installation-1)
  - [direct python code](#direct-python-code)
  - [happi database](#happi-database)
  - [configuration from YAML files](#configuration-from-yaml-files)
- [Install bluesky starter script](#install-bluesky-starter-script)
- [Revision control](#revision-control)

# Install instrument package

Configuration of a scientific instrument for Bluesky can be any of these methods:

1. independent package installed into python environment
1. ipython profile configuration
1. direct python code
1. [happi](https://pcdshub.github.io/happi) database
1. configuration from YAML files

Note the older method of defining the instrument in the
[ipython profile](https://ipython.readthedocs.io/en/stable/config/intro.html#profiles)
using number files is deprecated as it quickly becomes difficult to manage
a typical instrument at a beam line.  Rather than use numbered files, read below to
install the instrument package into an ipython profile.

No matter which method you pick, you are **encouraged strongly** to place your
instrument package into a revision control system.

## independent package installed into python environment

From experience, we've learned that configuration of a scientific instrument
for the Bluesky framework is well-described as a Python package.  Both
[USAXS](https://github.com/APS-USAXS/ipython-usaxs/tree/master/profile_bluesky/startup/instrument)
and [XPCS](https://github.com/aps-8id-dys/ipython-8idiuser/tree/master/profile_bluesky/startup/instrument)
instruments are good examples.  The python package layout lends itself
to an intuitive description of the instrument into its component parts.  Here
is the basic layout:

```
    instrument/         # the instrument package
        session_logs    # setup log files
        framework/      # setup the Bluesky framework
        devices/        # define the ophyd (hardware AND software) devices
        callbacks/      # define any code to be called from the Run Engine (or other)
        plans/          # procedures custom to the instrument
        other/          # could be `utils` instead
```

### Download & Installation

Use these bash commands to download and install the instrument package
template as an independent source code directory.

```
mkdir ~/bluesky    # or your directory of choice
cd ~/bluesky
export URL=https://raw.githubusercontent.com/BCDA-APS/use_bluesky/master/templates/
wget ${URL}/instrument_template.tar.gz
tar xzf instrument_template.tar.gz
/bin/rm  -rf instrument_template.tar.gz
mv ./instrument_template/instrument .
mv ./instrument_template/setup.py .
mv ./instrument_template/README.md .
mv instrument_template/blueskyStarter.sh ~/bin/blueskyStarter.sh
/bin/rm -rf instrument_template
conda activate bluesky_2020_9
pip install -e .
```

## ipython profile configuration

This is the most common installation for APS instruments.  It works well
for IPython console sessions.  It is slightly more difficult to use (than the
independent package installation) for Jupyter notebook sessions since the path
to the instrument package must be defined within the Jupyter session.

### Download & Installation

Use these bash commands to download and install the instrument package
template in your ipython `bluesky` profile.

```
export URL=https://raw.githubusercontent.com/BCDA-APS/use_bluesky/master/templates/
cd ~/.ipython/profile_bluesky/startup
wget ${URL}/instrument_template.tar.gz
tar xzf instrument_template.tar.gz
/bin/rm  -rf instrument_template.tar.gz
mv ./instrument_template/instrument .
mv ./instrument_template/00-instrument.py .
mv ./instrument_template/README.md .
mv instrument_template/blueskyStarter.sh ~/bin/blueskyStarter.sh
/bin/rm -rf instrument_template
```

## direct python code

Sometimes, such as for demos or exectuable scripts, the instrument
(or parts) are declared directly in the python code.  See the
[lessons](/lessons/README.md) in this repository for examples.

## happi database

[HAPPI](https://pcdshub.github.io/happi) is a database (using
[YAML](https://yaml.org/) files) for keeping track of
devices / configuration and fabricating ophyd (and pydm or other) objects on demand.

Configuration of a scientific instrument from a happi database is
under development at this time.  It's too early to document this now.

## configuration from YAML files

The APS HT-HEDM instrument has developed their own YAML
format to configure parts of the instrument, such as for
[tomography](https://github.com/aps-ht-hedm/jupyter-ht-hedm/blob/master/seisidd/config/tomo_devices.yml).  Consult this team for more information


# Install bluesky starter script

It is useful to create a bash shell script to start a bluesky
console session.  The shell script can define environment variables
needed only by this session.  See the example shell script
[`blueskyStarter.sh`](/templates/example_blueskyStarter.sh) in this directory.

1. Install this script into your account's `~/bin` directory (or some directory
on your exectuable `$PATH` where you install such things).
1. Change the script's name to something relevant, such as `blueskyWONI` (for the hypothetical *WONI* instrument)
1. Make sure the script is executable (`chmod +x blueskyWONI`)
1. In the script, edit `CONDA_ACTIVATE` for the path to your conda `base` environment.
1. In the script, edit `CONDA_ENVIRONMENT` for the name of your conda environment for bluesky.  Use `base` if no custom environment.
1. In the script, edit `IPYTHON_PROFILE` for the name of your IPython profile for bluesky.
1. In the script, edit `IPYTHONDIR` for the path to your IPython directory.
1. Add any other setup (such as environment variables) needed to run.

# Revision control

You are **encouraged strongly** to place your instrument package
into a revision control system such as git.  Compare with this
[table](https://github.com/BCDA-APS/use_bluesky/wiki#aps-list) of
other bluesky instruments at the APS.
