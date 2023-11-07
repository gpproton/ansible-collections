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


## Refrences

- [Ansible pilot](https://github.com/lucab85/ansible-pilot)
- [Grafana Collection](https://github.com/grafana/grafana-ansible-collection)
