#Task 4. Calculating summaries from groups of rows (grouping)

library(data.table)
library(ggplot2)

#this time we'll use the sig pairs file, this file contains multiple results per gene
#and per variant and per chromosome etc, its therefore a good choice to practice summarising
#data by grouping.
pairs <- fread("Kidney_Cortex.v8.signif_variant_gene_pairs.txt.gz")
#there are 33 r
dim(pairs)

#there is a slightly quirkily named special variable called '.N' that can be used inside
#the square brackets of data.table. 
#.N is always a single number which is equal to the number of rows in the data.table
#you can also print the numbver of rows in a data.table, data.frame or matrix using nrow()
nrow(pairs)
pairs[,.N]
#calculate if nrow really is equal to the special .N variable
nrow(pairs) == pairs[,.N]

#whats really useful about .N is you can use it after grouping your data and .N is reported
#for each group of rows
#in this example we group our rows by ensembl gene ID (gene_id) and then use .N to print
#the number of rows (statistically significant results) for each gene - a useful summary
#also the number of rows in the output is the number of unique gene_ids in the whole sig pairs file
#we supply the grouping variable name after two commas
pairs[,.N,gene_id]
#the same can be applied to variant id
pairs[,.N,variant_id]

#by default .N get given a column name of "N",
#lets make that more informative
pairs[,.(num_stat_sig_results=.N),gene_id]

#a really useful feature of grouping is you can group by multiple variables at once
#in this case we're just checking that there's no repeated pairs between a gene and a variant - which there aren't
pairs[,.(num_stat_sig_results=.N),.(gene_id,variant_id)]

#another cool feature of grouping is you can put a query in as one of the grouping variables
#this shows results grouped by gene and by direction of association
pairs[,.(num_stat_sig_results=.N),.(gene_id, slope>0)]

#we can also label that query
pairs[,.(num_stat_sig_results=.N),.(gene_id, positive_association=slope>0)]




