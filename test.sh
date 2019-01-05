#!/bin/bash
#find out/ -name "*" -print0 | xargs -0 rm
clingo 1 generator.lp z_tests/generator-passing.lp  --parallel-mode 4
clingo 1 generator.lp z_tests/generator-fail-1.lp  --parallel-mode 4
