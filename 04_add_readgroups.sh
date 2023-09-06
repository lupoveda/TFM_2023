#!/usr/bin/env bash

cd ~/Documents/TFM/OC_TFM/alignment

cat sample_rg_fields.txt | while read SAMPLE LB PU ID
do
  gatk AddOrReplaceReadGroups \
  --INPUT "$SAMPLE".bam \
  --OUTPUT "$SAMPLE".rg.bam \
  --RGLB "$LB" \ #RGLB: library identifier
  --RGPU "$PU" \ #RGPU: platform unit. [FLOWCELL].[LANE].[SAMPLE BARCODE]
  --RGPL ILLUMINA \ #RGPL corresponds to the platform, and this would be ILLUMINA
  --RGSM "$SAMPLE" \ #RGSM: the sample
  --RGID "$ID" #RGID: read group id
done 
