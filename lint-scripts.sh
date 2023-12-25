#!/bin/sh

conda activate kerry-flux

R -e "lintr::lint_dir()"
