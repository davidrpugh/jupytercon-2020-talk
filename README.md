[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/davidrpugh/jupytercon-2020-talk/pytorch-env)

# JupyterLab + PyTorch (and friends!)

Contains configuration files for a JupyterLab-based data science project using [PyTorch](https://pytorch.org/). You can explore the JupyterLab UI/UX via 
Binder by clicking the "launch binder" button above, but the instance provision by Binder does not (yet) include GPUs.  

To build the environment on your local (Linux!) machine clone this branch of the repository and then run the environment build script as follows.

```
git clone --single-branch --branch pytorch-env https://github.com/davidrpugh/jupytercon-2020-talk.git
cd jupytercon-2020-talk
./bin/create-conda-env.sh
```

