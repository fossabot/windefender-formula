# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import WINDEFENDER with context %}

/opt/windefender:
  file.directory:
    - user: {{ WINDEFENDER.hostuser.name }}
    - group: {{ WINDEFENDER.hostuser.group }}

/opt/windefender/src:
  file.recurse:
    - source: salt://windefender/files/windows-defender
    - user: {{ WINDEFENDER.hostuser.name }}
    - group: {{ WINDEFENDER.hostuser.group }}
    - show_changes: false
