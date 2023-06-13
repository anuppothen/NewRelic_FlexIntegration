#!/bin/bash
filename=""
currentSystemDate=`date +%F`
if [ -d $1 ]
    then
        cd $1
        filecount=`ls -lrt | grep -v total | grep -v -i archive | wc -l`
            if [ $filecount -gt 0 ]
                then
                    for filename in `ls | grep -v -i archive`
                    do
                        fileModDate=`stat -c %y filename | cut -d " " -f  1`
                            if [ $currentSystemDate == $fileModDate ]
                                then
                                    echo $1 $filename $(wc -l $filename)
                            fi
                    done
            fi
fi
