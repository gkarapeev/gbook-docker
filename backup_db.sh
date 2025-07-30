#!/bin/sh

docker cp $1:/gbook/db/data.db ~/db_backups/data_$(date +%Y%m%d_%H%M%S).db
