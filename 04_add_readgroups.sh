#!/usr/bin/env bash

cd ~/Documents/TFM/OC_TFM/alignment

cat sample_rg_fields.txt | while read SAMPLE LB PU ID
do
  gatk AddOrReplaceReadGroups \
  --INPUT "$SAMPLE".bam \
  --OUTPUT "$SAMPLE".rg.bam \
  --RGLB "$LB" \
  --RGPU "$PU" \
  --RGPL ILLUMINA \
  --RGSM "$SAMPLE" \
  --RGID "$ID"
done 
