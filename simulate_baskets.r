library(dplyr)
library(ggplot2)
library(readr)

dir('data/')
csvs = list.files('data', pattern = '*.csv',full.names=TRUE)
df = bind_rows(sapply(csvs, read_tsv))

str(df)
colnames(df)
ggplot(df, aes(x=price,y=ContentsQuantity)) + geom_point() 
ggplot(df, aes(x=price)) + geom_histogram(bins=200)
fivenum(df$price)
df[df$price>=20,'name']

#sample some baskets

sample_n(df[order(df$tpnb),  'name'], 100) 

# randomise quantity

# work out total cost

# work out total weight
df %>% select(name, price) %>% filter(
