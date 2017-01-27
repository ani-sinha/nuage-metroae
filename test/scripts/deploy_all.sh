#!/bin/sh
#Running VSD installation script 
set -e

cp ./test/files/setup.yml.VSDOnly ./setup.yml
ansible-playbook setup.yml -vvvv
ansible-playbook reset_build.yml -vvvv
ansible-playbook build.yml -vvvv
./metro-ansible test_install.yml -vvvv

cp ./test/files/setup.yml.VSCOnly ./setup.yml
ansible-playbook setup.yml -vvvv
ansible-playbook reset_build.yml -vvvv
ansible-playbook build.yml -vvvv
./metro-ansible test_install.yml -vvvv

cp ./test/files/setup.yml.VSTATOnly ./setup.yml
ansible-playbook setup.yml -vvvv
ansible-playbook reset_build.yml -vvvv
ansible-playbook build.yml -vvvv
./metro-ansible test_install.yml -vvvv

cp ./test/files/setup.yml ./setup.yml
ansible-playbook setup.yml -vvvv
ansible-playbook reset_build.yml -vvvv
ansible-playbook build.yml -vvvv
./metro-ansible test_cleanup.yml -vvvv

