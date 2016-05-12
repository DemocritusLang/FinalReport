#!/bin/bash

CODE_LOC="$HOME/Democritus"
LLVM_FILES="democritus.ml scanner.mll parser.mly semant.ml ast.ml codegen.ml"
C_FILES="bindings.c"

# iterate over each file and put typeseted copy into .tex file
for filename in $LLVM_FILES; do
    TEX_FILE=$filename.tex
    echo "\\section{$filename}" >> $TEX_FILE
    echo "\\begin{minted}[breaklines,linenos]{ocaml}" >> $TEX_FILE
    cat $CODE_LOC/$filename >> $TEX_FILE
    echo "\\end{minted}" >> $TEX_FILE 
done

for filename in $C_FILES; do
    TEX_FILE=$filename.tex
    echo "\\section{$filename}" >> $TEX_FILE
    echo "\\begin{minted}[breaklines,linenos]{c}" >> $TEX_FILE
    cat $CODE_LOC/$filename >> $TEX_FILE
    echo "\\end{minted}" >> $TEX_FILE 
done
