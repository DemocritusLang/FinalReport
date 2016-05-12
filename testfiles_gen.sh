CODE_LOC="$HOME/Democritus"
TEX_FILE=tex/tests.tex
TEST_FILES=$CODE_LOC/tests

rm $TEX_FILE
touch $TEX_FILE

echo "\\chapter{Tests and Output}" >> $TEX_FILE
echo "\\begin{lstlisting}" >> $TEX_FILE

for filename in $(ls $TEST_FILES); do
    echo "\\subsection{$filename}" >> $TEX_FILE
    echo "\\begin{lstlisting}" >> $TEX_FILE
    cat $TEST_FILES/$filename >> $TEX_FILE
    echo "\\end{lstlisting}" >> $TEX_FILE
done

echo -e "\n" >> $TEX_FILE
echo "\\end{lstlisting}" >> $TEX_FILE
