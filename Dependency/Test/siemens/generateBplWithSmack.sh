#!/bin/bash

CRNT_DIR=$(readlink -f $(dirname ${BASH_SOURCE[0]}))
INSTALL_SHARE=../../share

for file in `find $CRNT_DIR -name '*'`; do dos2unix $file; done

cp -rf $INSTALL_SHARE smackShare

for proj in $(ls $CRNT_DIR); do
    cd $CRNT_DIR
    if [ -d $CRNT_DIR/$proj ]
    then
	cd $CRNT_DIR/$proj
	cd source
	patch -N < ../source/original.patch
	make -f smackMakefile clean all &> /dev/null
	#diff -u orig.$proj.c $proj.c  > original.patch
	cd -

	for dir in $(ls -d v*); do
	    if [ -d $dir ]
	    then
		cd $dir
		pwd
		cp ../source/smackMakefile .
		patch -N < ../source/original.patch
		make -f smackMakefile clean all &> /dev/null
		cd $CRNT_DIR/$proj
	    fi
	done

    fi
done

