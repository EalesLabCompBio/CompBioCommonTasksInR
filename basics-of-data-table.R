library(data.table)

#There are three important parts of manipulating a data.table
#these are "i", "j" and "by"
#you i, j and by are supplied inside the [] after the variable name of data.table

#if we create a data.table with random data called "test"
test <- data.table(liver_expression=rnorm(100,mean=10, sd=10/2), 
                   kidney_expression=rnorm(100, mean=5, sd=5/2), 
                   gene=sample(paste0("gene-",1:10),100,replace = T))


#i, j and by are here
#test[i, j, by]

#i allows you to do things with rows
#j allows you to do things with columns and compute new columns, data.tables or other output from the columns
#by allows you to do things with groups of rows
#if you want to supply i, j or by then they are ordered and must be separated by commas within []

#this just uses i, so no need for a comma
test[liver_expression>20]

#this just uses j, you can select one column by just writing its name, this will extract a single column as a vector
test[,liver_expression]

#this uses j, but not i, so you need a comma before the j expression
#this reports the smallest liver expression value in the whole table
test[,min(liver_expression)]

#this uses j and by together but not i, it generates a single new column which is automatically labelled as V1
#it counts the number of expression values greater than 10 for each gene separately
test[,sum(liver_expression>10), gene]

#this uses i, j and by
test[kidney_expression>5, sum(liver_expression>10), gene]

#this create a more complex result from the j expression (with column names)
test[, .(median_liver_exp=median(liver_expression), mean_liver_exp=mean(liver_expression), median_kidney_exp=median(kidney_expression), mean_kidney_exp=mean(kidney_expression)), gene]

#you can also break the code over multiple lines to make it easier to read and write
test[, .(median_liver_exp=median(liver_expression), 
         mean_liver_exp=mean(liver_expression), 
         median_kidney_exp=median(kidney_expression), 
         mean_kidney_exp=mean(kidney_expression)), 
     gene]

#finally it can be useful to chain two data.table [] operations together
#in the first we calculate gene-wide median expression in liver and in 
#the second we select those genes with median liver expression above 10
test[,.(median_liver_exp=median(liver_expression)),gene][median_liver_exp>10]
#if you want to keep the result of any of the operations above just assign it to
#a variable name
highly_expressed_liver_genes <- test[,.(median_liver_exp=median(liver_expression)),gene][median_liver_exp>10]
highly_expressed_liver_genes

#a useful second operation to combine with a first grouping operation is order()
#order() will sort (smallest to largest) the table by whichever column you supply to it
#heres the unordered version
test[,.(median_liver_exp=median(liver_expression)),gene]
#and the ordered version
test[,.(median_liver_exp=median(liver_expression)),gene][order(median_liver_exp)]

