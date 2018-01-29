#!/bin/sh -x

ORIGIN=$1
BACKUP=$2

mkdir -p $BACKUP/snapshots/ $BACKUP/latest/

find $BACKUP/snapshots/ -mindepth 1 -maxdepth 1 -mtime +7 | xargs rm -rfv

SNAP=$(date -Iseconds)

cp -arl $BACKUP/latest $BACKUP/snapshots/$SNAP
touch $BACKUP/snapshots/$SNAP

rsync -avP --delete-after $ORIGIN/ $BACKUP/latest/
