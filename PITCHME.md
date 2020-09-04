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

```bash
# use the following command to create env using conda
conda env create --prefix $PWD/env --file environment.yml --force
```
---

#### Custom kernels for your project's Conda environment

Allows you to launch Jupyter Notebooks and Python consoles for each Conda environment within a common JupyterLab install

---

```yaml
dependencies:
  ...
  - ipykernel
  - ipython
  ...
```

Next, rebuild the Conda environment using the following command.

```bash
# re-create the env and then create the custom kernel for the active env
conda env create --prefix $PWD/env --file environment.yml --force
conda activate $PWD/env
python -m ipykernel install --user --name internal-use-only --display-name "What you see in JupyerLab"
```
---

#### %conda and %pip magic commands

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
