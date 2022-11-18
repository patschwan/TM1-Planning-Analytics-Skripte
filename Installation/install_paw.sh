#!/bin/sh

# PAW auf neuem RHEL Server installieren; Installer liegt im <source>
# Außerdem zu tun:
# 1) Admintool Konfig
# 1 a) paw.env manuell editieren und EnableSSL=true setzen
# 2) aus SSL Cert pa-workspace.pem (per OpenSSL erzeugen; Anleitung in PPT Doku)

## Vorbereitung Installation 
mkdir -p /paw/paw_2_0_81
cp -rp <PATH...>/ipa_workspace_local_2.0.81.682.zip /paw/paw_2_0_81
unzip /paw/paw_2_0_81/ipa_workspace_local_2.0.81.682.zip

# ./paw/paw_2_0_81/Start.sh startet die Installation


## SSL Zertifikat pa-workspace.pem erstellen
prepare_ssl='/paw/prepare_ssl'
mkdir -p $prepare_ssl
cp <source>/openssl-toolkit.zip $prepare_ssl
cp -rp <source>/server_cert_request.cer $prepare_ssl
cp /etc/ssl/private.key $prepare_ssl/pa-workspace.pem
cat $prepare_ssl/server_cert_request.cer >> $prepare_ssl/pa-workspace.pem

## erstelltes SSL nach paw
cp -rp /paw/paw_2_0_81/config/pa-workspace.pem /paw/paw_2_0_81/config/pa-workspace.pem.bak
yes | cp -rp $prepare_ssl/pa-workspace.pem /paw/paw_2_0_81/config/pa-workspace.pem

## PAW installieren - startet im Anschluss Admintool auf hostname:8888
# ab hier interactive Kontext per IBM Installer (Backups erstellt? y/n, Docker laden? y/n)
server=$(hostname -i)
export ADMINTOOL_IP=$server
/paw/paw_2_0_81/Start.sh