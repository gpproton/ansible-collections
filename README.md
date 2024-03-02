# Ansible Collections

A personal collection of ansible tasks and roles

## Setup requirments

### Python setup

```shell
## Debian/Ubuntu
sudo apt install -y python3 python3-virtualenv
## Fedora
sudo dnf install -y python3 python3-virtualenv
```

Setup requirements on user profile

```shell
python3 -m pip install --upgrade --user molecule ansible ansible-lint setuptools wheel
```

Create virtual environment for unix OS

```shell
python3 -m venv venv && \
source venv/bin/activate && \
python3 -m pip install molecule ansible ansible-lint wheel
```

## Environment setup for Windows

```shell
python3 -m venv venv
.\venv\Scripts\activate
python3 -m pip install molecule ansible ansible-lint wheel
```

## Usage

Create requirement file

```bash
touch requirements.yml
```

```yaml
---
collections:
  - name: https://github.com/gpproton/ansible-collections.git
    type: git
    version: main
```

install with:

```bash
ansible-galaxy install -r requirements.yml

## Or

ansible-galaxy install git+https://github.com/gpproton/ansible-collections.git
ansible-galaxy install git+git@github:gpproton/ansible-collections.git
```

## Bash tweaks

Fix bash completion

```shell
case "$SHELL" in 
  *bash*)
    if ! shopt -oq posix; then
        if [ -f /usr/share/bash-completion/bash_completion ]; then
            . /usr/share/bash-completion/bash_completion
        elif [ -f /etc/bash_completion ]; then
            . /etc/bash_completion
        fi
    fi
    ;;
esac
```


## Refrences

- [Ansible pilot](https://github.com/lucab85/ansible-pilot)
- [Grafana Collection](https://github.com/grafana/grafana-ansible-collection)
- [Geerlingguy Ansible](https://github.com/geerlingguy/ansible-role-docker)
