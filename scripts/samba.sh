#!/usr/bin/env bash

config_path=$1

cp "${config_path}/smb.conf" /etc/samba/smb.conf

sudo restart smbd
sudo restart nmbd

sudo smbpasswd -a vagrant