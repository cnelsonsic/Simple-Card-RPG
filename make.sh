#!/bin/bash

cd cards
rm *.pdf
cd ..

python adventurequest_cards.py

python generate_latex_cards.py

cd cards

for i in *.tex
do
	pdflatex $i
	pdflatex $i
done

evince *.pdf

rm *.tex
rm *.aux
rm *.log
