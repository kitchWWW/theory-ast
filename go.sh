#!/bin/bash
#find out/ -name "*" -print0 | xargs -0 rm
rm out/*
clingo 10 notes.lp prettify.py 
cd out
lilypond *

