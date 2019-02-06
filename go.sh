#!/bin/bash
#clingo 0 generator.lp chords-2.lp prettify.py chords-general.lp 
clingo 10 generator.lp sp-general.lp sp-no-cantus.lp sp-cantus/puzzle.lp prettify.py --parallel-mode 4
#clingo 10 generator.lp sp-general.lp sp-no-cantus.lp sp-cantus/canon.lp prettify.py --parallel-mode 4
#clingo 10 generator.lp sp-general.lp sp-1.lp sp-cantus/c.lp prettify.py --parallel-mode 4
