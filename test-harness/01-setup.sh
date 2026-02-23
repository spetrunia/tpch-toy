#!/bin/bash

source local_dataset_path.sh

# This is made as follows:
#  - Get the tarball from http://homepages.cwi.nl/~boncz/job/imdb.tgz
#  - import into PostgreSQL and export back with \N for NULL values
#  - Several manual edits where the '\' character at the end of field is not
#    escaped

if [ ! -f dbt3s1 ] ; then

  if [ ! -f $LOCAL_DATASET_PATH/dbt3s1.tar.bz2 ] ; then
    echo "Failed to find mysql dataset at $LOCAL_DATASET_PATH/dbt3s1.tar.bz2"
    exit 1
  fi
  tar jxvf $LOCAL_DATASET_PATH/dbt3s1.tar.bz2
fi

mkdir -p tmp-mariadb

