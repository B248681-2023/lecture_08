#!/bin/bash

all_sequences="all_sequences.fasta"
if [[ -z "$1" || ! "$1" =~ \.txt$ ]]; then
	echo "You need to provide an accession text file."
	exit 1
fi

> ${all_sequences}

while read -r accession; do
       echo -e "Downloading ${accession} ... "
       wget -qO- "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=protein&id=${accession}&strand=1&rettype=fasta&retmode=text" >> ${all_sequences}
       echo -e "\n" >> ${all_sequences}
done < "$1"
