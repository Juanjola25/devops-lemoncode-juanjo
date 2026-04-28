#!/bin/bash

if [ -z "$1"]; then 
    texto="Que me gusta la bash!!"
    else
        texto="$1"
    fi
    
    
mkdir -p foo\dummy foo\empty
edit "$texto" > foo\dummy\file1.txt
edit nul foo\dummy\file2.txt

copy foo\dummyfile1.txt > foo\dummy\file2.txt


move foo\dummy\file2.txt foo\empty