#!/bin/bash

CODE_LOC="$HOME/Democritus"
LLVM_FILES="democritus.ml scanner.mll parser.mly semant.ml ast.ml codegen.ml"
C_FILES="bindings.c"
TEX_FILE="tex/code.tex"

rm $TEX_FILE
touch $TEX_FILE

echo "\\chapter{Code Listing}" >> $TEX_FILE

# iterate over each file and put typeseted copy into .tex file
for filename in $LLVM_FILES; do
    echo "\\section{$filename}" >> $TEX_FILE
    echo "\\begin{lstlisting}{ocaml}" >> $TEX_FILE
    cat $CODE_LOC/$filename >> $TEX_FILE
    echo "\\end{lstlisting}" >> $TEX_FILE
done

for filename in $C_FILES; do
    echo "\\section{$filename}" >> $TEX_FILE
    echo "\\begin{lstlisting}{c}" >> $TEX_FILE
    cat $CODE_LOC/$filename >> $TEX_FILE
    echo "\\end{lstlisting}" >> $TEX_FILE
done

sed -i 's/_/\\_/g' $TEX_FILE
