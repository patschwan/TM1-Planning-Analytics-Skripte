#!/bin/sh

# Voraussetzungen:
# Root aka sudo -i
# ipa_workspace_VERSION.zip liegt entpackt in $newVersionPath

installer=ipa_workspace_local_<new_version>.zip
server=$(hostname -i)
oldVersionPath='.../paw/paw_<old_version>'
newVersionPath='.../paw/paw_<new_version>'

## Backup erstellen
# PAW muss während des Backups laufen - Service also nicht vorher stoppen
# Skript erzeugt Backups der DBs in $oldVersionPath/backup
$oldVersionPath/scripts/backup.sh

# alten PAW stoppen
$oldVersionPath/scripts/paw.sh stop

## Backups der Sample/Templates der neuen PAW Version
# cp -rp erzeugte eine Dateikopie mit den ursprünglichen Timestamps, User, etc.
cp -rp $newVersionPath/config/certs $newVersionPath/config/certs_bak
cp -rp $newVersionPath/config/pa-workspace.pem $newVersionPath/config/pa-workspace.pem.bak

## Konfiguration in die neue Version übernehmen
# Admintool Konfiguration wird in paw.env gespeichert
# die pa-workspace.pem sollte regelmäßig das SSL sein (?)
cp $oldVersionPath/config/paw.env $newVersionPath/config/paw.env
cp $oldVersionPath/config/pa-workspace.pem $newVersionPath/config/pa-workspace.pem

## IBM Installer ausführen
# Installer lädt die Aktualisierungen für die Docker Container
# Startet im Anschluss das Admintool -> - hier PAW neugestarten = restart (!!)
# bei SSH Session wäre das Admintool über localhost:8888 "erreichbar" (oder eben nicht...)
# durch export ADMINTOOL_IP=$server ist das Admintool (im Browser auf dem Windows Notebook)
# per server.mydomain:8888 erreichbar

export ADMINTOOL_IP=$server
cd $newVersionPath
./Start.sh
