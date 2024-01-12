#YouTube link


#Task 1. Reading a file

#any line beginning with "#" is a comment line and will not be interpreted by R
#our first lines load the required R packages using the "library" function, you only have to this once per Rstudio session
#if these libraries are not installed then Rstudio will ask you if you want to install them
#or you can paste the following in the Console
#install.packages("data.table")
#install.packages("ggplot2")
library(data.table)
library(ggplot2)

#You can see that in the "Files" tab we have two main files "Kidney_Cortex.v8.egenes.txt.gz" and "Kidney_Cortex.v8.signif_variant_gene_pairs.txt.gz"
#These files are gzipped, I also have unzipped these files so they can be inspected in a text editor like "TextEdit" on MacOS or "Notepad" on Windows.

#For all file reading we will use the fread() function
#This is a function from the data.table package, it is extremely fast, and also solves little niggly problems like file headers and text delimiters for you.
#fread() is very flexible it can read from text files, URLs from the web and from the output of commandline executables
#fread() can also read gzipped files without you having to unzip them first
#fread() produces a table of data as output (a data.table) this has exactly the same functionality as standard R data.frame
# "<-" is called the assignment operator it assigns new data to variable names

#As an example you can read either the zipped or
egenes_gzipped <- fread("Kidney_Cortex.v8.egenes.txt.gz")
#unzipped version of the egenes file and get exactly the same data
egenes_unzipped <- fread("Kidney_Cortex.v8.egenes.txt")

#dim() tells you the number of rows and then columns in a data.table
dim(egenes_gzipped)
dim(egenes_unzipped)

#If you want to print the first few lines of a table do something like this
egenes_gzipped[1:3]
egenes_unzipped[1:3]
#You can see the data are identical

#Other useful arguments for fread() are "nrows" which allows you to specify how many of data to load
#which is good when you have a very big file and just want to sample the data
first_10_lines <- fread("Kidney_Cortex.v8.egenes.txt.gz", nrows = 10)
dim(first_10_lines)

#also "header", these GTEx files have header lines, but if you file doesn't
#then supply "header=FALSE"
no_header <- fread("Kidney_Cortex.v8.egenes.txt.gz", header=FALSE)
#you can see that the first row of data is now the column names because we told fread() that our file didn't have a header
no_header[1:3]



