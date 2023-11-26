#!/bin/bash

ansible-playbook ./playbooks/setup.yml -i ./inventories/${1} -t ${2:-all}
