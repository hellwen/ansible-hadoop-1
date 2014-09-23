#!/bin/bash
#
# Deploy production / stagging cluster
#
# @author anthonycorbacho
#

IFS=$','

#export ANSIBLE_ERROR_ON_UNDEFINED_VARS=True
export ANSIBLE_HOST_KEY_CHECKING=False

if [[ $# -gt 0 ]]; then
  echo 'Running ansible-playbook -i hosts site.yml --tags' "$*"
  ansible-playbook --user=root --ask-pass -i hosts site.yml --tags "$*"
else
  echo 'Running ansible-playbook -i hosts site.yml'
  ansible-playbook --user=root --ask-pass -i hosts site.yml
fi
