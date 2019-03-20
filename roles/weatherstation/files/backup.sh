#!/bin/bash

DATE=$(date +%F)
WEEWXDIR=/home/weewx/

cd /home/weewx/backup

tar -czf weewx-${DATE}.tar.gz ${WEEWXDIR}weewx.conf ${WEEWXDIR}skins/ ${WEEWXDIR}bin/user/

/usr/bin/mysqldump -uweewx -pweewx weewx | gzip -c > weewx-${DATE}.sql.gz

scp weewx-${DATE}.* dave@woodhouse:/media/backup/weather/

: '
Instructions for restore
-Install the same version of weewx as was on the source machine
-As weewx user
cd /
tar -xvf <backup file>

mysql -u root -p
CREATE DATABASE weewx;
USE weewx;
source <unzipped dump file>
'