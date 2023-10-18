#!/bin/bash

if [[ -z $1 || -z $2 || -z $3 || -z $4 ]]; then
	echo "Must provide database and  query key and web env and desired filename for output (in that order)"
	exit 1
fi
echo "variable 1 is ${1}"
echo "v2 is ${2}"
echo "v3 is ${3}"
echo "v4 is ${4}"
wget -qO "${4}" \
	"https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=${1}&query_key=${2}&WebEnv=${3}&rettype=fasta&returnmode=text"

echo "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=${1}&query_key=${2}&WebEnv=${3}&rettype=fasta&returnmode=text"
