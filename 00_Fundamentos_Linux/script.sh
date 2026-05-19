#!/bin/bash

if [ -z "$1" ]; then
    texto="Que me gusta la bash!!"
else
    texto="$1"
fi

mkdir -p foo/dummy foo/empty
echo "$texto" > foo/dummy/file1.txt
touch foo/dummy/file2.txt

cat foo/dummy/file1.txt > foo/dummy/file2.txt

mv foo/dummy/file2.txt foo/empty/
