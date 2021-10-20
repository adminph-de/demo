#!/bin/bash

# Batch Recovery
POSTFIX=$1
ls -f ./backup/*.tar.gz | xargs -n 1 basename -s .tar.gz |
    while read -r VOLNAME; do 
        echo $VOLNAME; 
        docker volume create --name ${POSTFIX}${VOLNAME}
        docker run --rm \
           -v ${POSTFIX}${VOLNAME}:/volume \
           -v $(pwd)/backup:/backup \
        alpine sh -c "rm -rf /volume/* /volume/..?* /volume/.[!.]* ; tar -C /volume/ -zxvf /backup/${VOLNAME}.tar.gz"
    done
