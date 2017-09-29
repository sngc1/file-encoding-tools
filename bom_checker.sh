#!/bin/sh

# Recursively checks the file type of .java files.

find ./ -name '*.java' -exec file {} \;
