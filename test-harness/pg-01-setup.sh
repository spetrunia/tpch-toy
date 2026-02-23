#!/bin/bash

source local_dataset_path.sh
if [ ! -f dbt3s1-pg ] ; then
   
  if [ ! -f $LOCAL_DATASET_PATH/dbt3s1.tar.bz2 ] ; then
    echo "Failed to find mysql dataset at $LOCAL_DATASET_PATH/dbt3s1.tar.bz2"
    exit 1
  fi
  rm -rf dbt3s1-pg.tmp
  mkdir -p dbt3s1-pg.tmp
  (
    cd dbt3s1-pg.tmp 
    tar jxvf $LOCAL_DATASET_PATH/dbt3s1.tar.bz2
    for i in dbt3s1/*.tbl ; do
      sed 's/|$//' $i >  $i.tbl2
      mv $i.tbl2 $i
    done
  )
  mv dbt3s1-pg.tmp  dbt3s1-pg
fi

