#!/bin/bash
#find out/ -name "*" -print0 | xargs -0 rm
rm out/*
clingo 10 generator.lp sp-general.lp sp-1.lp cf/c-major-1.lp prettify.py 
cd out
lilypond * > /dev/null 2>&1 &
sleep 1.5 
open *.pdf

