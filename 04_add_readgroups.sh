#!/usr/bin/env bash

cd ~/Documents/TFM/results

cat sample_rg_fields.txt | while read SAMPLE LB PU ID
do
  gatk AddOrReplaceReadGroups \
  --INPUT ~/Documents/TFM/alignment_all/"$SAMPLE".bam \
  --OUTPUT ~/Documents/TFM/alignment_all/"$SAMPLE".rg.bam \
  --RGLB "$LB" \
  --RGPU "$PU" \
  --RGPL ILLUMINA \
  --RGSM "$SAMPLE" \
  --RGID "$ID"
done 
