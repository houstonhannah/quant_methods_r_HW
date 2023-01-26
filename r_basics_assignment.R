#' ---
#' author: "Hannah Houston"
#' title: "HW1: R Basics"
#' date: "19 Jan 2023"
#' output: html_document
#' ---
#' 


#' **Downloading Data**
#' ---
#' Manual download and import
#' ---

tgpp <- read.csv(file = "/Users/hannahhouston/Documents/quant_methods_r/quant_r_class_notes/tgpp.csv", header = TRUE)

#' Using URL
#' ---

#tgpp <- read.csv('https://raw.githubusercontent.com/dmcglinn/quant_methods/gh-pages/data/tgpp.csv')          
            
#' **Homework Questions**
#' ---
#' 
#' 1) What are the names of the columns in this dataset?
#' ---
column_name <- colnames(tgpp)
print(column_name)
#'
#'2) How many rows and columns does this data file have?
#'---
rows_and_columns <- dim(tgpp)
print(rows_and_columns) #4080 rows and 11 columns
#'
#'3) What kind of object is each data column? Hint: checkout the function sapply().
#'---
object_type <- sapply(tgpp, class)
print(object_type)
#' 
#'4) What are the values of the the datafile for rows 1, 5, and 8 at columns 3, 7, and 10
#'---
row1_col3 <- tgpp[1, 3]
print(row1_col3)
row5_col7 <- tgpp[5, 7]
print(row5_col7)
row8_col10 <- tgpp[8, 10]
print(row8_col10)

#'5)Create a pdf of the relationship between the variables “scale” and “richness”
#'---
#Scale is the area in square meters of the quadrat in which richness was recorded. 
#Be sure to label your axes clearly, and choose a color you find pleasing for the points. 
#To get a list of available stock colors use the function colors(). Also see this link: http://research.stowers-institute.org/efg/R/Color/Chart/index.htm

#pdf('./diversity_plot.pdf') #pdf will show up in working directory
par(mfrow = c(1,1))
plot(tgpp$scale, tgpp$richness, xlab='Scale',
     ylab='Richness', frame.plot=F, col='rosybrown3', pch=8, cex=1)
#dev.off() #where to stop pdf


#' 6) What happens to your plot when you set the plot argument log equal to ‘xy’. plot(..., log='xy')   
#' ---  

#pdf('./diversity_plot_logxy.pdf') #pdf will show up in working directory
par(mfrow = c(1,1))
plot(tgpp$scale, tgpp$richness, xlab='Scale',
     ylab='Richness', frame.plot=F, col='salmon', pch=6, cex=1, log='xy')
#dev.off()   #where to stop pdf  