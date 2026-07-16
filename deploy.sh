#!/bin/bash
set -euo pipefail

ansible-playbook playbooks/site.yml \
  --ask-pass \
  --ask-become-pass
