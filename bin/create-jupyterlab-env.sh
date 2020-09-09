#!/bin/bash --login
set -e

conda env create --name jupyterlab-base-env --file environment.yml --force
conda activate jupyterlab-base-env
source postBuild
