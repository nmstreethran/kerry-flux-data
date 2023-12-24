#!/bin/sh
# jupyter nbconvert --sanitize-html --to notebook --inplace **/*.ipynb

jupyter nbconvert --to script **/*.ipynb
