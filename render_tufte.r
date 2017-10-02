library(rmarkdown)
library(bookdown)
library(tint)
library(tufte)
#render('lists_conversion_experience.rmd',output_format=tufte_handout())
#render('lists_conversion_experience.rmd',output_format=ioslides_presentation)
#render('reconstruction.rmd',output_format=tintPdf())
render('reconstruction.rmd',output_format=word_document2())

