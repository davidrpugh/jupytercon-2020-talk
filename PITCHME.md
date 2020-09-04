### Best practices for managing Jupyter-based data science projects using Conda (+Pip)

---

### System-wide Jupyter install

Conda (+Pip) manage a Jupyter installation shared across all projects.

* Common set of JupyterLab extensions simplifies user interface (UI) and user experience (UX).
* No need to frequently re-build JupyterLab
* Allows for quicker start of new projects as no need to install (and build!) JupyterLab.

---

#### Typical Conda `environment.yml` for a "system-wide" install

```yaml
name: jupyter-base-env

channels:
  - conda-forge
  - defaults
  
dependencies:
  - jupyterlab
  - jupyterlab-git # provides git support
  - jupyter_conda  # provides Conda environment and package access
  - pip
  - pip:
    - -r file:requirements.txt # extensions available via pip go here
  - python
```
---

#### Create `jupyter-base-env` using Conda

Put the following commands inside a Bash script `create-jupyter-env.sh` to automate the process of environment creation (including JupyterLab re-build).

```bash
#!/bin/bash

conda env create --name jupyter-base-env --file environment.yml --force
conda activate jupyter-base-env
source postBuild # put jupyter labextension install commands here
```

---

#### Keep your `jupyter-base-env` *lean*

The `jupyter-base-env` should *only* contain Jupyter (+dependencies) and required extensions.

* Automate the process of building `jupyter-base-env` with Bash script.
* Each of your projects should have separate Conda environment.
* Create custom kernel for each project's Conda environment.

---

#### Create custom kernel for each project's Conda environment

A custom kernel for a project's Conda environment allows you to launch Jupyter Notebooks and IPython consoles for that Conda environment within a common JupyterLab installation.

---

#### First, add dependencies to your project;

```yaml
dependencies:
  ...
  - ipykernel
  - ipython
  ...
```
---

#### next, rebuild the Conda environment;

```bash
# same command used to create an environment can also re-build it!
conda env create --prefix $PROJECT_DIR/env --file environment.yml --force
```
---

#### finally, activate the env and create the kernel!

```bash
conda activate $PROJECT_DIR/env
python -m ipykernel install \
    --user \
    --name name-for-internal-use-only \
    --display-name "Name you will see in JupyerLab"
```
---

#### Example

INSERT SCREENSHOT FROM JUPYTERLAB HERE!

---

#### `%conda` and `%pip` magic commands

Built-in IPython magic commands for installing packages via *into the active kernel* Conda ([`%conda`](https://ipython.readthedocs.io/en/stable/interactive/magics.html#magic-conda)) or Pip ([`%pip`](https://ipython.readthedocs.io/en/stable/interactive/magics.html#magic-pip)).

* Both commands can be used from within Jupyter Notebooks or IPython consoles. 
* Both `%conda` and `%pip` are mostly useful for proto-typing new projects.
* For "production", prefer adding new packages to `environment.yml`/`requirements.txt` (and re-creating environment).

---

### Project-based Jupyter install

Conda (+Pip) manage separate Jupyter installations for each project.

* More flexible UI/UX as JupyterLab extensions can customized for each project
* Ability to have different versions of JupyterLab installed on the same machine allows for experimentation with bleeding edge features
* Automatically makes a data science project "binder-ready". 

---

#### Examples

INSERT LINKS TO EXAMPLE REPOS HERE!

* Scikit Learn + friends
* NVIDIA RAPIDS + BlazingSQL + Dask

---

#### Template for a project-based Jupyter install

INSERT LINK TO TEMPLATE REPO HERE!

---

### Where to find me?
