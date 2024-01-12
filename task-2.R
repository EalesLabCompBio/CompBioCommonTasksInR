#YouTube link


#Task 2. Selecting specific rows from a table of data (row subsetting)

library(data.table)
library(ggplot2)

#first we load the significant pairs file
sig_pairs <- fread("Kidney_Cortex.v8.signif_variant_gene_pairs.txt.gz")
#it has quite a few rows
dim(sig_pairs)
#have a quick look at the table and make sure the data look correct, by default this will print the top 5 and bottom 5 rows from the sig_pairs data.table
sig_pairs

#If we want to see results for just one gene e.g. "FGF5" then we need subst by "gene_id" for the GENCODE ID for FGF5 which is "ENSG00000138675.16"
sig_pairs[gene_id == "ENSG00000138675.16"]
#we can see that are 7 eSNPs for FGF5
#If we want to capture these data and use them later we can assign the output of the command above to a new variable
fgf5_results <- sig_pairs[gene_id == "ENSG00000138675.16"]
#Then to see the data in fgf5_results we just type the name of the variable, this is true of most variables in R
fgf5_results

#If we want to save this table as a csv file we can simply do
fwrite(fgf5_results, "fgf5-eqtls-kidney-cortex.csv")

#Other row subsets are: to select rows for a set of genes (rather than a single one)
genes_i_want_results_on <- c("ENSG00000128891.15","ENSG00000184227.7","ENSG00000142102.15")
set_of_genes_results <- sig_pairs[gene_id %in% genes_i_want_results_on]

#Also we can select using numeric values, like p-values
really_sig <- sig_pairs[pval_nominal < 1e-25]

#Or we can place two subsets after each other to select only variants which are nearest to their gene (i.e. distance to the TSS is > -100 AND < 100)
near_esnps <- sig_pairs[tss_distance > -100][tss_distance < 100]
#you can do a simple plot just to check what TSS distances have been selected
hist(near_esnps[,tss_distance])





