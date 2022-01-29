library(data.table)
library(ggplot2)

sig_pairs <- fread("Kidney_Cortex.v8.signif_variant_gene_pairs.txt.gz")

#there are 111,169 different eSNP(variant) / eGene(gene) pairs
#we can see how many different eSNPs there are in the file like this (don't worry about the ".N" yet)
sig_pairs[, .N, variant_id]
#and the same for the genes
sig_pairs[, .N, gene_id]


