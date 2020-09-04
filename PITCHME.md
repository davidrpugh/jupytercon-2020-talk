### Best practices for managing Jupyter-based data science projects using Conda (+Pip)

---

### System-wide Jupyter install

"System-wide" Jupyter install: Conda (+Pip) manage a Jupyter installation shared across all projects.

* Common set of JupyterLab extensions available for all projects which simplifies UI/UX
* No need to frequently re-build JupyterLab
* Quicker start for prototyping new projects as no need to install Jupyter (+dependencies)

---

#### System-wide `environment.yml`

```yaml
name: jupyter-base-env

channels:
  - conda-forge
  - defaults
  
dependencies:
  - jupyterlab
  - jupyterlab-git # extensions available via conda listed here
  - pip
  - pip:
    - -r file:requirements.txt # extensions available via pip go here
  - python
```
---

#### Use the following command to create env using Conda

```bash
conda env create --prefix $PWD/env --file environment.yml --force
```
---

#### Custom kernels for your project's Conda environment

A custom kernel for your Conda environment allows you to launch Jupyter Notebooks and IPython consoles for that Conda environment within a common JupyterLab installation.

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
conda env create --prefix $PWD/env --file environment.yml --force
```
---

#### finally, activate the env and create the kernel!

```bash
conda activate $PWD/env
python -m ipykernel install \
    --user \
    --name name-for-internal-use-only \
    --display-name "Name you see in JupyerLab"
```
---

#### Example

INSERT SCREENSHOT FROM JUPYTERLAB HERE!

---

#### `%conda` and `%pip` magic commands

There are two built-in IPython magic commands for installing packages via either Conda ([`%conda`](https://ipython.readthedocs.io/en/stable/interactive/magics.html#magic-conda)) or Pip ([`%pip`](https://ipython.readthedocs.io/en/stable/interactive/magics.html#magic-pip) into the active kernel.

* Both commands can be used from within Jupyter Notebooks or IPython consoles. 
* Both `%conda` and `%pip` are mostly useful for proto-typing new projects.
* For "production", prefer adding packages to `environment.yml`/`requirements.txt` (and re-creating environment).

---

### Project-based Jupyter install

"Project-specific" Jupyter install: Conda (+Pip) manage separate Jupyter installations for each project.

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
