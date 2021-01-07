# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import WINDEFENDER with context %}

multiav-windefender-present:
  cmd.run:
    - name: podman build --security-opt seccomp=./seccomp.json -t malice-plugins/windefender .
    - cwd: /opt/windefender/src
    - runas: {{ WINDEFENDER.hostuser.name }}
