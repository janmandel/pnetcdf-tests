#!/bin/bash

if [ $# -eq 0 ]
  then
     echo usage: $0 executale 
     exit 1
fi

qsub test.sub ./$1
