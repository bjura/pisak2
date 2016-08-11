#!/usr/bin/env bash
set -e
mkdir dist
python3.5 setup.py --command-packages=stdeb.command bdist_deb
