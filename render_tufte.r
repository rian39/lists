library(rmarkdown)
library(bookdown)
library(tufte)
render('lists_conversion_experience.rmd',output_file='index.html', output_format=html_document2(toc=TRUE, toc_depth = 1, toc_float=FALSE, theme='journal'))
