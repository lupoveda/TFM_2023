#!/usr/bin/env bash

cd ~/Documents/TFM/data 

samtools faidx reference/hg19.fasta
gatk CreateSequenceDictionary --REFERENCE reference/hg19.fasta
