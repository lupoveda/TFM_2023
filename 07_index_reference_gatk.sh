#!/usr/bin/env bash

cd ~/Documents/TFM/data #Cambia el directorio actual al camino especificado

samtools faidx reference/hg19.fasta #Este comando utiliza la herramienta Samtools para crear un índice (.fai) para el archivo de referencia genómica "hg19.fasta".
gatk CreateSequenceDictionary --REFERENCE reference/hg19.fasta #Este comando utiliza la herramienta GATK para crear un diccionario de secuencias para el archivo de referencia "hg19.fasta"
