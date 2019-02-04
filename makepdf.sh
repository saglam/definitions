#!/bin/sh

pdflatex ${1}
biber ${1}

while pdflatex ${1} | tee /dev/tty | grep --quiet "(re)run\s\|Rerun\s\|rerun\s"; do
  tput bold
  echo "A rerun is required. Running pdflatex again."
  tput sgr0
done

return $(test -f ${1}.pdf)

