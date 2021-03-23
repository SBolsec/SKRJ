#! /bin/bash

if [ "$#" -ne 2 ]; then
  echo "Incorrect number of arguments."
  echo "Usage: ./zadatak6.sh dir1 dir2"
  exit 1
fi

if [ ! -d "$1" ]; then
  echo "dir1 does not exist!"
  exit 1
fi

if [ ! -d "$2" ]; then
  echo "dir2 does not exist!"
  exit 1
fi

dir1=$1
dir2=$2

for file in `ls $dir1`
do
  # check if it is a directory
  if [ -d ${dir1}/${file} ] ; then
    continue
  fi

  #check if the file does not exist in dir2
  if [ ! -e ${dir2}/${file} ] ; then
    echo "${dir1}/${file} --> ${dir2}"
    continue
  fi

  #check if this is a newer file
  if [ ${dir1}/${file} -nt ${dir2}/${file} ] ; then
    echo "${dir1}/${file} --> ${dir2}"
    continue
  fi
done

for file in `ls $dir2`
do
  # check if it is a directory
  if [ -d ${dir1}/${file} ] ; then
    continue
  fi

  #check if the file does not exist in dir1
  if [ ! -e ${dir1}/${file} ] ; then
    echo "${dir2}/${file} --> ${dir1}"
    continue
  fi

  #check if this is a newer file
  if [ ${dir2}/${file} -nt ${dir1}/${file} ] ; then
    echo "${dir2}/${file} --> ${dir1}"
    continue
  fi
done