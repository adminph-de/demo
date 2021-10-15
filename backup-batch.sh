#!/bin/bash

# example: ./backup-batch.sh myvolumepostfix

POSTFIX=$1
  while read -r volume
  do
    docker run --rm \
      -v $volume:/volume \
      -v $(pwd)/backup:/backup \
      alpine tar -cvzf /backup/$volume.tar.gz -C /volume ./
      echo "$volume"
  done < <(docker volume ls | grep -e ${POSTFIX} | awk '{ print $2 }')
