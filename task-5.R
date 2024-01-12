#YouTube link


#Task 5. Adding new columns to a table using data from existing columns (new columns)

library(data.table)
library(ggplot2)

#the trouble with the pairs file is it lacks useful extra detail about the results
pairs <- fread("Kidney_Cortex.v8.signif_variant_gene_pairs.txt.gz")

#for example it would be useful to know which chromosome the result comes from
#we can see from the variant ID values that the chromosome, position, alleles and genome build
#are all reported in the ID, lets print the first 3 rows
pairs[1:3]

#we can use regular expressions to extract regions of text from variant_id
#and we can use a new data.table operation to put the extracted text into a new column
#first we'll test the regular expression extraction, it always takes a few tries
#to get it right for me, we'll store the first variant id from the table in a new variable
test_variant_id <- pairs[1,variant_id]

#then we run sub() (substitute) to identify and extract regions of the variant_id value
#the first argument is a regular expression (regex) pattern the syntax of these is fairly 
#complex and takes a bit of practice, but they're so useful that its worth effort
#see ?sub for some examples
#the pairs of () identify capturing groups, these can then be referred to in the second 
#argument to sub() using \\1 - for the first group and \\2 for the second, etc.
#^ means start of text
#$ means end of text
#\\w means a word character and + means we're looking for one or more word character
sub("^(\\w+)_(\\w+)_(\\w+)_(\\w+)_(\\w+)$" , "chromosome=\\1 position=\\2 ref=\\3 alt=\\4 genome=\\5", test_variant_id)

#if we just want the chromosome
sub("^(\\w+)_(\\w+)_(\\w+)_(\\w+)_(\\w+)$" , "\\1", test_variant_id)

#now we have the regex sorted, and the sub() arguments we can put the whole thing
#inside a data.table [] and then assign the ouput of sub() to a new column
#assignment of values to specific column within a data.table is done using
#':=' it can be used to create new columns or to overwrite the valaues of an 
#existing column
pairs[,variant_chromosome:=sub("^(\\w+)_(\\w+)_(\\w+)_(\\w+)_(\\w+)$" , "\\1", variant_id)]

#using stuff from task 4 lets summarise the number of results by our new chromosome column
pairs[,.(num_results=.N),variant_chromosome]

#we can see that we have results across 23 chromosomes
#which chromosome has the most sig results?
pairs[,.(num_results=.N),variant_chromosome][order(num_results)]

#the good thing about regex and sub() is they're surprisingly quick to run, even on millions
#of rows, so even though its not the most efficient way to do it, we can extract all the data
#out of the variant_id using slights mods to our first sub() command
#now lets extract the position
pairs[,variant_position:=sub("^(\\w+)_(\\w+)_(\\w+)_(\\w+)_(\\w+)$" , "\\2", variant_id)]

#have a go at writing out and generating the other columns of data below

