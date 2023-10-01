#!/usr/bin/env bash

cd ~/Documents/TFM/OC_TFM/results/variants_germline # Se cambia de directorio y se describe el directorio
#In this step we filter according to the values recommended for hard filtering by the Best practices of the GATK suite.

gatk VariantFiltration \ #con esta herramienta de GATK se pueden filtrar las variantes de SNP y en este caso se han utilizado los filtros recomendados por GATK para Hard filtering. 
#More info on hard filtering in the GATK best practise guidelines: https://gatk.broadinstitute.org/hc/en-us/articles/360035890471-Hard-filtering-germline-short-variants

--variant germline_OCcohort.SNP.vcf \
--filter-expression "QD < 2.0"              --filter-name "QD2" \
--filter-expression "QUAL < 30.0"           --filter-name "QUAL30" \
--filter-expression "SOR > 3.0"             --filter-name "SOR3" \
--filter-expression "FS > 60.0"             --filter-name "FS60" \
--filter-expression "MQ < 40.0"             --filter-name "MQ40" \
--filter-expression "MQRankSum < -12.5"     --filter-name "MQRankSum-12.5" \
--filter-expression "ReadPosRankSum < -8.0" --filter-name "ReadPosRankSum-8" \
--output germline_OCcohort.SNP.filtered.vcf #output file of the fileterd SNPs


# Información sobre los parámetros seleccionados
# QD - QualByDepth - es la confianza de la variante (del campo QUAL) dividida por la profundidad no filtrada de las muestras no homocigotas de referencia. Esta anotación tiene como objetivo normalizar la calidad de la variante para evitar la inflación causada cuando la cobertura es profunda.
# QUAL - Puntuación de calidad - puntuación Phred - el filtrado riguroso eliminará cualquier variante en la que la lectura tenga una puntuación Phred inferior a Q30.
# SOR - StrandOddsRatio - una forma de estimar el sesgo de hebra utilizando una prueba similar a la prueba de la razón de probabilidades simétrica. SOR se creó porque FS tiende a penalizar las variantes que ocurren en los extremos de los exones. La recomendación de filtrado riguroso es fallar las variantes con un valor de SOR mayor de 3, al menos para eliminar la cola larga de variantes que muestran un sesgo bastante claro según la prueba de SOR.
# FS - FisherStrand - es la probabilidad escalada de Phred de que haya un sesgo de hebra en el sitio. La alela alternativa se vio más o menos a menudo en la hebra hacia adelante o hacia atrás que la alela de referencia. Cuando hay poco o ningún sesgo de hebra en el sitio, el valor de FS estará cerca de 0. Las recomendaciones de filtrado riguroso de GATK tienen como objetivo fallar las variantes con un valor de FS superior a 60.
# MQ - calidad media de la raíz cuadrada de la asignación en todas las lecturas en el sitio - esta anotación proporciona la raíz cuadrada del promedio de los cuadrados de las calidades de asignación en el sitio. Está destinada a incluir la desviación estándar de las calidades de asignación. Incluir la desviación estándar nos permite tener en cuenta la variación en el conjunto de datos. Cuando las calidades de asignación son buenas en un sitio, el valor de MQ estará alrededor de 60. La recomendación de GATK es fallar cualquier variante con un valor de MQ inferior a 40.0.
# MQRankSum - aproximación z basada en u de la Prueba de Rango para las calidades de asignación. Compara las calidades de asignación de las lecturas que respaldan la alela de referencia y la alela alternativa. Un valor cercano a cero es el mejor e indica poca diferencia entre las calidades de asignación. El umbral de filtrado riguroso es -12.5.
# ReadPosRankSum - aproximación z basada en u de la Prueba de Rango para la posición del sitio dentro de las lecturas. Compara si las posiciones de las alelas de referencia y alternativa son diferentes dentro de las lecturas. El umbral de filtrado riguroso elimina cualquier variante con un valor de ReadPosRankSum inferior a -8.0.

#Information on the chosen parameters
#QD - QualByDepth- is the variant confidence (from the QUAL field) divided by the unfiltered depth of non-hom-ref samples. This annotation is intended to normalize the variant quality in order to avoid inflation caused when there is deep coverage. 
#QUAL - Quality score - Phred score - the hard filtering will remove any variants where the read has a phred score lower than Q30. 
#SOR - StrandOddsRatio - way to estimate strand bias using a test similar to the symmetric odds ratio test. SOR was created because FS tends to penalize variants that occur at the ends of exons.hard filtering recommendation of failing variants with an SOR value greater than 3 will at least remove the long tail of variants that show fairly clear bias according to the SOR test
#FS - FisherStrand - is the Phred-scaled probability that there is strand bias at the site. the alternate allele was seen more or less often on the forward or reverse strand than the reference allele. When there little to no strand bias at the site, the FS value will be close to 0. Hard filtering recommendations from GATK aim to fail variants with an FS value greater than 60
#MQ - root mean square mapping quality over all the reads at the site - this annotation gives the square root of the average of the squares of the mapping qualities at the site. It is meant to include the standard deviation of the mapping qualities. Including the standard deviation allows us to include the variation in the dataset. When the mapping qualities are good at a site, the MQ will be around 60. GATK recommendation is to fail any variant with an MQ value less than 40.0
#MQRankSum - u-based z-approximation from the Rank Sum Test for mapping qualities. It compares the mapping qualities of the reads supporting the reference allele and the alternate allele. A value close to zero is best and indicates little difference between the mapping qualities. hard filter threshold is -12.5
#ReadPosRankSum - u-based z-approximation from the Rank Sum Test for site position within reads. It compares whether the positions of the reference and alternate alleles are different within the reads. Hard filtering threshold removes any variant with a ReadPosRankSum value less than -8.0


