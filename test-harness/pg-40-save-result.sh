#!/bin/bash

source psql-vars.sh

echo "select * from my_tpch_result" | $PSQL test | tee -a tmp-postgresql/result.txt

