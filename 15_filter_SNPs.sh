#!/usr/bin/env bash

cd ~/Documents/TFM/OC_TFM/results/variants_germline
#In this step we filter according to the values recommended for hard filtering by the Best practices of the GATK suite.

gatk VariantFiltration \
--variant germline_OCcohort.SNP.vcf \
--filter-expression "QD < 2.0"              --filter-name "QD2" \
--filter-expression "QUAL < 30.0"           --filter-name "QUAL30" \
--filter-expression "SOR > 3.0"             --filter-name "SOR3" \
--filter-expression "FS > 60.0"             --filter-name "FS60" \
--filter-expression "MQ < 40.0"             --filter-name "MQ40" \
--filter-expression "MQRankSum < -12.5"     --filter-name "MQRankSum-12.5" \
--filter-expression "ReadPosRankSum < -8.0" --filter-name "ReadPosRankSum-8" \
--output germline_OCcohort.SNP.filtered.vcf #output file of the fileterd SNPs
#QD - QualByDepth- is the variant confidence (from the QUAL field) divided by the unfiltered depth of non-hom-ref samples. This annotation is intended to normalize the variant quality in order to avoid inflation caused when there is deep coverage. 
#QUAL - Quality score - Phred score - the hard filtering will remove any variants where the read has a phred score lower than Q30. 
#SOR - StrandOddsRatio - way to estimate strand bias using a test similar to the symmetric odds ratio test. SOR was created because FS tends to penalize variants that occur at the ends of exons.hard filtering recommendation of failing variants with an SOR value greater than 3 will at least remove the long tail of variants that show fairly clear bias according to the SOR test
#FS - FisherStrand - is the Phred-scaled probability that there is strand bias at the site. the alternate allele was seen more or less often on the forward or reverse strand than the reference allele. When there little to no strand bias at the site, the FS value will be close to 0. Hard filtering recommendations from GATK aim to fail variants with an FS value greater than 60
#MQ - root mean square mapping quality over all the reads at the site - this annotation gives the square root of the average of the squares of the mapping qualities at the site. It is meant to include the standard deviation of the mapping qualities. Including the standard deviation allows us to include the variation in the dataset. When the mapping qualities are good at a site, the MQ will be around 60. GATK recommendation is to fail any variant with an MQ value less than 40.0
#MQRankSum - u-based z-approximation from the Rank Sum Test for mapping qualities. It compares the mapping qualities of the reads supporting the reference allele and the alternate allele. A value close to zero is best and indicates little difference between the mapping qualities. hard filter threshold is -12.5
#ReadPosRankSum - u-based z-approximation from the Rank Sum Test for site position within reads. It compares whether the positions of the reference and alternate alleles are different within the reads. Hard filtering threshold removes any variant with a ReadPosRankSum value less than -8.0
#More info on hard filtering in the GATK best practise guidelines: https://gatk.broadinstitute.org/hc/en-us/articles/360035890471-Hard-filtering-germline-short-variants
