# Ansible Collections

A personal collection of ansible tasks and roles

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
