#This project is intend to provide working code examples as applied to real GTEx eQTL results
#The GTEx eQTL results files were downloaded - as part of a big archive of many tissues - from here https://storage.googleapis.com/gtex_analysis_v8/single_tissue_qtl_data/GTEx_Analysis_v8_eQTL.tar

#We have two main files of data that we will be using
#Both of these are tab-delimited text files that have been compressed using gzip (hence the .gz file extension)

#1. Kidney_Cortex.v8.egenes.txt.gz - this is a file which reports the most statistically significant eSNP for all genes expressed in kidney cortex (24,807 genes) even if the results is not significant after correction for multiple testing.
#2. Kidney_Cortex.v8.signif_variant_gene_pairs.txt.gz - this is a file which reports all statistically significant eSNPs for all genes with one or more statistically significant eSNP after correction for multiple testing (qvalue < 0.05)

#This project will provide code samples for the following tasks
#As with most programming tasks there are usually multiple ways to achieve the same aim
#but for these examples we will be using R and the "data.table" package
#"data.table" is very good for genomics data because it is very efficient on memory and CPU
#which is important when you have millions of variants, thousands of genes and hundreds of samples
#In all cases we will representing our data in a table, with columns and rows
#In all cases each row will represent an individual result or observation
#We also use the "ggplot2" package for the plotting tasks

#Task 1. Reading a file
#Task 2. Selecting specific rows from a table of data (row subsetting)
#Task 3. Selecting specific columns from a table of data (column subsetting)
#Task 4. Calculating summaries from groups of rows (grouping)
#Task 5. Adding new columns to a table using data from existing columns (new columns)
#Task 6. Merging two tables together - adding new columns to an existing table by matching on an identifier (merging)
#Task 7. Renaming columns
#Task 8. Reordering columns
#Task 9. Renaming, reordering and subsetting columns all at once (table restructuring)
#Task 10. Basic plotting
#Task 11. Plotting with facets
#Task 12. Combining two plots together
#Task 13. How to circularise a heatmap

#Student task 1. How many genes are eGenes on chromosome 1? 
#Student task 2. What is the mean, median, standard deviation, maximum and minimum number of eSNPs per eGene?
#Student task 3. How many genes are eGenes on each chromosome and can you plot it?
#Student task 4. Can you create a manhattan plot of eQTLs on chromosome 1





