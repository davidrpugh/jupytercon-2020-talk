### Best practices for managing JupyterLab-based data science projects using Conda (+Pip)

JupyterCon 2020

---

#### Dr. David R. Pugh
Staff Scientist, KAUST Visualization Core Lab
Certified Instructor, The Carpentries

---

@snap[north-west]
### Outline
@snap[end]

---

@snap[north-west]
### System-wide JupyterLab install
@snapend

Conda (+Pip) manage a JupyterLab installation shared across all projects.

@ul[spaced]
* Common set of JupyterLab extensions simplifies user interface (UI) and user experience (UX).
* No need to frequently re-build JupyterLab
* Allows for quicker start of new projects as no need to install (and build!) JupyterLab.
@ulend

---

@snap[north-west]
#### `environment.yml` for a "system-wide" install
@snapend

```yaml
name: jupyterlab-base-env

channels:
  - conda-forge
  - defaults
  
dependencies:
  - jupyterlab
  - jupyterlab-git # provides git support
  - nodejs # required for building (some) extensions
  - pip
  - pip:
    - -r file:requirements.txt # extensions available via pip go here
  - python
  - xeus-python # alt kernel with nice support for debugging
```

---

@snap[north-west]
#### `requirements.txt` for a "system-wide" install
@snapend

```
jupyter-lsp
python-language-server[all]
```

---

@snap[north-east]
#### Keep your `jupyterlab-base-env` *lean*
@snapend

Environment should *only* contain JupyterLab and required extensions (+deps).

@ul[spaced]
* Automate environment build with Bash script.
* Each of your projects should have separate Conda environment.
* Create custom kernels for project Conda environments.
@ulend

---

@snap[north-west]
#### Automate environment build with Bash script
@snapend

```bash
#!/bin/bash --login

conda env create --name jupyterlab-base-env --file environment.yml --force
conda activate jupyterlab-base-env
source postBuild # put jupyter labextension install commands here
```

---

@snap[north-west]
#### Create custom kernels for project Conda environments
@snapend

Custom kernel for a project's Conda environment allows you to launch Jupyter Notebooks and IPython consoles for that Conda environment within a common JupyterLab installation.

@ul[spaced]
* Automate process for all envs using [`jupyter-conda`](https://github.com/fcollonval/jupyter_conda) extension.
* Manually create custom kernel for more fine-grained control.
@ulend

---

@snap[north-west]
#### First, add `ipykernel` to your project;
@snapend

```yaml
name: null

channels:
  ...
  - conda-forge
  - defaults
  
dependencies:
  ...
  - ipykernel
  ...
```
---

@snap[north-west]
#### next, rebuild the Conda environment;
@snapend

```bash
# same command used to create an environment can also re-build it!
conda env create \
    --prefix $PROJECT_DIR/env \
    --file environment.yml \
    --force
```
---

@snap[north-west]
#### finally, activate the env and create the kernel!
@snapend

```bash
conda activate $PROJECT_DIR/env
python -m ipykernel install \
    --user \
    --name name-for-internal-use-only \
    --display-name "Name you will see in JupyerLab"
```
---

@snap[north-west]
#### Example
@snapend

INSERT SCREENSHOT FROM JUPYTERLAB HERE!

---

@snap[north-west]
#### `%conda` and `%pip` magic commands
@snapend

Built-in IPython magic commands for installing packages via into the *active* kernel Conda ([`%conda`](https://ipython.readthedocs.io/en/stable/interactive/magics.html#magic-conda)) or Pip ([`%pip`](https://ipython.readthedocs.io/en/stable/interactive/magics.html#magic-pip)).

@ul[spaced]
* Both commands can be used from within Jupyter Notebooks or IPython consoles. 
* Both `%conda` and `%pip` are mostly useful for proto-typing new projects.
* For "production", prefer adding new packages to `environment.yml`/`requirements.txt` (and re-creating environment).
@ulend

---

@snap[north-west]
### Project-based JupyterLab install
@snapend

Conda (+Pip) manage separate JupyterLab installations for each project.

@ul[spaced]
* More flexible UI/UX as JupyterLab version and extensions can customized for each project.
* Easier experimentation with bleeding edge features of JupyterLab.
* Automatically makes a data science project repo "Binder-ready". 
@ulend

---

@snap[north-west]
#### `environment.yml` for a "project-based" install
@snapend

```yaml
name: null

channels:
  - conda-forge
  - defaults
  
dependencies:
  - jupyterlab
  - jupyterlab-git # extensions available via conda go here
  - pip
  - pip:
    - -r file:requirements.txt # packages available via pip go here
  - python
```
---

@snap[north-west]
#### Automate environment creation with Bash script
@snapend

```bash
#!/bin/bash --login

ENV_PREFIX=$PROJECT_DIR/env # env directory included in Python .gitignore
conda env create \
    --prefix $ENV_PREFIX 
    --file environment.yml \
    --force
conda activate $ENV_PREFIX
source postBuild # put jupyter labextension install commands here
```

---

@snap[north-west]
#### Examples
@snapend

INSERT LINKS TO EXAMPLE REPOS HERE!

* Scikit Learn + friends
* PyTorch + friends
* NVIDIA RAPIDS + BlazingSQL + Dask

---

@snap[north-west]
#### System-wide or project-based: which to choose?
@snapend

---

@snap[north-west]
### Thanks!
@snapend

#### Dr. David R. Pugh
Staff Scientist, KAUST Visualization Core Lab
Certified Instructor, The Carpentries

@snap[south-west text-08]
@fa[twitter](TheSandyCoder)
@snapend

@snap[south text-08]
@fa[github](davidrpugh)
@snapend

@snap[south-east text-08]
@fa[linkedin](davidrpugh)
@snapend
