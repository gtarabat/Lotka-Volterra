# Overview

This repository contains Jupyter and Matlab codes used at the *Models. Codes. Data.* lecture at the *Digital Societies: Fluch oder Segen - oder beides?* workshop, held in Magliaso, Switzerland from 4th to 8th of September, 2018.

The codes implement Lotka-Volterra model and its variations.
Jupyter (Python notebook) and Matlab codes are more or less identical in content.


## Jupyter installation

In order to run codes, following packages are required:
`python3`,
`python3-pip` (for installing other packages),
`jupyter` (Python notebook),
`numpy` (mathematical tools),
`matplotlib` (plotting),
`scipy` (for the ODE solver) and
`cma` (for optimization).

For Debian/Ubuntu Linux, use the following commands to install all dependencies:
```bash
sudo apt-get install python3 python3-pip
python3 -m pip install jupyter
python3 -m pip install numpy
python3 -m pip install matplotlib
python3 -m pip install scipy
python3 -m pip install cma
```

To run Jupyter, open a terminal (or `cmd` on Windows), navigate to the folder containing the repository or the `.ipynb` notebook files and run the following:
```bash
jupyter notebook
```
