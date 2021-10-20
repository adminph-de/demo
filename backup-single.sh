#!/bin/bash

# Backup a single Volume
BAKVOL=$1
docker run --rm \
    -v ${BAKVOL}:/volume \
    -v $(pwd)/backup:/backup \
    alpine tar -cvzf /backup/${BAKVOL}.tar.gz -C /volume ./

echo ${BAKVOL}.tar.gz
