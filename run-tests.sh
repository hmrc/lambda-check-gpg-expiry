#!/usr/bin/env bash

virtualenv -p python3 venv
. venv/bin/activate
pip install -r requirements-tests.txt
nosetests -v --with-cover --cover-erase --cover-package=handler tests/*.py
flake8 handler.py
deactivate
