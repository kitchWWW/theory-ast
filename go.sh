#!/bin/bash
# clingo 0 generator.lp chords-2.lp prettify.py chords-general.lp 
clingo 10 generator.lp sp-general.lp sp-cantus/puzzle.lp sp-no-cantus.lp prettify.py --parallel-mode 4
