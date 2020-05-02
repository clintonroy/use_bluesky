# notebooks

This directory contains lessons, tutorials, examples, other - all in Jupyter notebooks

## Lessons

* [lesson1](lesson1.ipynb) - scaler and count
* [lesson2](lesson2.ipynb) - motor and scan
* [lesson3](lesson3.ipynb) - show data as it is acquired
* [lesson3: final](lesson3-final.ipynb) - final project from lesson3
* [basic scan with plot](basic-scan-with-plot.ipynb) - starting point for a general notebook (after lesson3)
* [lesson-tba-](working_with_area_detector_image_data.ipynb) - working with area detector image data

## Tips

* [Windows](windows.md) - Installing ophyd, Bluesky, *et al.* on Windows 10
* *Known* [supported browsers](https://github.com/jupyterlab/jupyterlab#prerequisites-and-supported-browsers) - [Firefox, Chrome, Safari](https://jupyterlab.readthedocs.io/en/latest/getting_started/installation.html#supported-browsers), KDE's Konqueror did not work

## Starting a Jupyter notebook session at APS

This session was started from the linux command line:

```
jemian@otz .../JEMIAN/Documents $ /APSshare/anaconda3/BlueSky/bin/jupyter-notebook
```

This command produced the following console output and then started my default web browser with a one-time-token-authenticated connection to the Jupyter Notebook server (still running in the console):

```
[I 15:16:57.546 NotebookApp] Serving notebooks from local directory: /home/oxygen18/JEMIAN/Documents
[I 15:16:57.546 NotebookApp] 0 active kernels
[I 15:16:57.546 NotebookApp] The Jupyter Notebook is running at:
[I 15:16:57.546 NotebookApp] http://localhost:8888/?token=e6a7584762c731a7c64f8f71246b3e616d779f7b4852c9d9
[I 15:16:57.546 NotebookApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
[C 15:16:57.547 NotebookApp] 

    Copy/paste this URL into your browser when you connect for the first time,
    to login with a token:
        http://localhost:8888/?token=e6a7584762c731a7c64f8f71246b3e616d779f7b4852c9d9
[I 15:17:00.863 NotebookApp] Accepting one-time-token-authenticated connection from ::1
```

Next, found the **New** drop-down menu button (top right, below the Lougout button) and selected **Python 3** to start a new notebook page using a Python 3 shell (the only kind available here).

Finally, from the **File** menu in the jupyter notebook (in the browser), selected **Rename ...** to save the *Untitled* notebook with the name `lesson1` (default extension is `.ipynb`).