#!/bin/bash

cp /var/lib/redis/dump.rdb "/var/lib/redis/backups/dump-`date '+%Y%m%d'`.rdb"