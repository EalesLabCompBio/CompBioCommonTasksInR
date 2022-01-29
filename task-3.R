#Task 3. Selecting specific columns from a table of data (column subsetting)

library(data.table)
library(ggplot2)

#lets start with the eGenes file 
egenes <- fread("Kidney_Cortex.v8.egenes.txt.gz")
#there are 33 columns, which can be very unwieldy to look at and process
dim(egenes)

#lets just print the most useful columns
egenes[,.(gene_name,variant_id,slope,pval_nominal,qval)]

#lets print those same columns in a different order
egenes[,.(pval_nominal, qval, variant_id, slope, gene_name)]

#lets print those same columns but label them differently
egenes[,.(hgnc_gene_symbol=gene_name, gtex_compid=variant_id, regression_coefficient=slope, pval_nominal, qval)]

#lets print those same columns but add in a new column
egenes[,.(gene_name,variant_id,slope,pval_nominal,qval,tissue="Kidney - Cortex")]

#we can extract just one column as a character vector
as_a_vector <- egenes[,variant_id]
class(as_a_vector)
length(as_a_vector)

#or we can extract a one column data.table
as_a_dt <- egenes[,.(variant_id)]
class(as_a_dt)
dim(as_a_dt)



