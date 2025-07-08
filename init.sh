#!/bin/sh

bun install
uv sync
# pip install --upgrade --user pipenv
# pipenv install
# pipenv shell
ansible-galaxy install --force -r requirements.yml
