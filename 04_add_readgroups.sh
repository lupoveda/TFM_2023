#!/usr/bin/env bash

cd ~/Documents/TFM/OC_TFM/alignment #Cambia el directorio actual al directorio especificado

cat sample_rg_fields.txt | while read SAMPLE LB PU ID 
#Este comando lee el contenido del archivo "sample_rg_fields.txt" línea por línea y divide cada línea en cuatro partes: 
#SAMPLE (nombre de la muestra), LB (identificador de la biblioteca), PU (unidad de plataforma), e ID (identificador de grupo de lecturas).
do
  gatk AddOrReplaceReadGroups \ #Este comando de GATK se utiliza para agregar o reemplazar información de grupos de lecturas en un archivo BAM.
  --INPUT "$SAMPLE".bam \ #Especifica el archivo BAM de entrada que se procesará. El nombre del archivo BAM se toma de la variable SAMPLE.
  --OUTPUT "$SAMPLE".rg.bam \ #Especifica el nombre del archivo BAM de salida que contendrá la información de grupos de lecturas. El nuevo archivo se crea con el sufijo ".rg.bam"
  --RGLB "$LB" \ #RGLB: library identifier -> Define el identificador de la biblioteca (library identifier) para el grupo de lecturas.
  --RGPU "$PU" \ #RGPU: platform unit. [FLOWCELL].[LANE].[SAMPLE BARCODE] -> Define la unidad de plataforma (platform unit) para el grupo de lecturas. 
  #La estructura de PU es "[FLOWCELL].[LANE].[SAMPLE BARCODE]"
  --RGPL ILLUMINA \ #RGPL corresponds to the platform, and this would be ILLUMINA -> Especifica la plataforma de secuenciación utilizada, que en este caso es "ILLUMINA"
  --RGSM "$SAMPLE" \ #RGSM: the sample -> Define el nombre de la muestra para el grupo de lecturas.
  --RGID "$ID" #RGID: read group id -> Define el identificador del grupo de lecturas.
done 
# Los archivos BAM de salida se crean con los nuevos grupos de lecturas y se guardan con el sufijo ".rg.bam"
