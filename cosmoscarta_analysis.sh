#!/bin/bash

if [[ -z "$1" || -z "$2" ]]; then
	echo "Must provide organism name and db"
	exit 1
fi

IFS="\><"
echo "${1}"
e_fetch_things=$(wget -qO- "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi?db="${2}"&term="${1}"&usehistory=y" | grep "QueryKey\|WebEnv")

query_key=$(echo ${e_fetch_things} | awk '{print$(NF-5)}')
web_env=$(echo ${e_fetch_things} | awk '{print$(NF-2)}')

echo "export query_key=${query_key}" >> "${HOME}/.bash_profile"
echo "export web_env=${web_env}" >> "${HOME}/.bash_profile"
unset IFS
