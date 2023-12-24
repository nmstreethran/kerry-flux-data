#!/bin/sh
# jupyter nbconvert --sanitize-html --to notebook --inplace **/*.ipynb

# jupyter nbconvert --to script **/*.ipynb

# mv **/*.r scripts

conda activate kerry-flux

R -e "lintr::lint_dir()"
