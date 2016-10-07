    library(ggplot2)
    tesco = read.csv('data/reference_data/tesco_groceries.csv')
    total = sum(tesco$actual, na.rm=TRUE) 
    tesco = read.csv('data/reference_data/tesco_groceries.csv')
dir()
setwd('~/lists')
    tesco = read.csv('data/reference_data/tesco_groceries.csv')
    total = sum(tesco$actual, na.rm=TRUE) 
    tesco = na.omit(tesco)
    tesco$actual = as.integer(tesco$actual)
    ggplot(tesco[tesco$actual>50,], aes(x=labels, y=actual, fill=labels)) +geom_bar(stat='identity') + coord_flip() + ggtitle('Tesco grocery items with more than 50 products') + theme(legend.position="none")
```
head(df)
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
df[1:3, 4:10]
df[1:3, 4:15]
df[1:3, 10:15]
df[1:3, 12:15]
df[1:3, c('image', 'tpnb')]
df$tpnb
sort(df$tpnb)
unique(sort(df$tpnb))
head(unique(sort(df$tpnb)))
diff(unique(sort(df$tpnb)))
hist(diff(unique(sort(df$tpnb))))
unique(sort(df$tpnb))
unique(order(df$tpnb))
df$name[(order(df$tpnb))]
head(df$name[(order(df$tpnb))])
unique(head(df$name[(order(df$tpnb))]))
head(unique(df$name[(order(df$tpnb))]))
head(unique(df$name[(order(df$tpnb))]),30)
head(unique(df[order(df$tpnb), c('tpnb', 'name')]),30)
head(unique(df[order(df$tpnb), c('tpnb', 'name')]),30)
head(unique(df[order(df$tpnb), c('tpnb', 'name')]),50)
df[order(df$tpnb), c('tpnb', 'name')]
sample_frac(df[order(df$tpnb), c('tpnb', 'name')], size=0.01)
sample_int(df[order(df$tpnb), c('tpnb', 'name')], 100)
sample.int(df[order(df$tpnb), c('tpnb', 'name')], 100)
sample_n(df[order(df$tpnb), c('tpnb', 'name')], 100)
sample_n(df[order(df$tpnb),  'name'], 100)
sample_n(df[order(df$tpnb),  'name'], 100)
sa
df %>% select(name, price) %>% sample_n(n=100)
df %>% select(name, price) %>% sample_n(100)
df %>% select(name, price) %>% sample_n(100) %>% summarize(basket_count = sum(price))
df %>% select(name, price) %>% sample_n(100) %>% summarize(basket_count = sum(price))
colnames(df)
df %>% select(name, price, ContentsQuantity) %>% sample_n(100) %>% summarize(basket_count = sum(price), weight = sum(ConstantsQuanity))
df %>% select(name, price, ContentsQuantity) %>% sample_n(100) %>% summarize(basket_count = sum(price), weight = sum(ContentsQuanity))
df %>% select(name, price, ContentsQuantity) %>% sample_n(100) %>% summarize(basket_count = sum(price), weight = sum(ContentsQuantity))
df$ContentsMeasureType
df$ContentsQuantity
df$ContentsMeasureType
table(df$ContentsMeasureType)
ifelse(df$ContentsMeasureType == CL, 100, 1)
ifelse(df$ContentsMeasureType == 'CL', 100, 1)
table(df$ContentsMeasureType)
ifelse(df$ContentsMeasureType == 'CL', 100, ifelse(df$ContentsMeasureType %in% c('KG', 'L'), 1000, 1))
df$weight = ifelse(df$ContentsMeasureType == 'CL', 100, ifelse(df$ContentsMeasureType %in% c('KG', 'L'), 1000, 1))
colnames(df)
df$AverageSellingUnitWeight
df %>% select(name, price, ContentsQuantity) %>% sample_n(100) %>% summarize(basket_count = sum(price), basket_weight = sum(weight)/1000)
df$weight
df$AverageSellingUnitWeight*ifelse(df$ContentsMeasureType == 'CL', 100, ifelse(df$ContentsMeasureType %in% c('KG', 'L'), 1000, 1))
df$weight = df$AverageSellingUnitWeight*ifelse(df$ContentsMeasureType == 'CL', 100, ifelse(df$ContentsMeasureType %in% c('KG', 'L'), 1000, 1))
df %>% select(name, price, ContentsQuantity) %>% sample_n(100) %>% summarize(basket_count = sum(price), basket_weight = sum(weight)/1000)
df %>% select(name, price, weight) %>% sample_n(100) %>% summarize(basket_count = sum(price), basket_weight = sum(weight)/1000)
df %>% select(name, price, weight) %>% sample_n(100) %>% summarize(basket_count = sum(price), basket_weight = sum(weight)/1000)
df %>% select(name, price, weight) %>% sample_n(30) %>% summarize(basket_count = sum(price), basket_weight = sum(weight)/1000)
df %>% select(name, price, weight) %>% sample_n(30) %>% summarize(basket_price = sum(price), basket_weight = sum(weight)/1000)
random
rand
sample(1:100, 1)
df %>% select(name, price, weight) %>% sample_n(sample(1:100,1) %>% summarize(basket_price = sum(price), basket_weight = sum(weight)/1000)
df %>% select(name, price, weight) %>% sample_n(sample(1:100,1)) %>% summarize(basket_price = sum(price), basket_weight = sum(weight)/1000)
df %>% select(name, price, weight) %>% sample_n(sample(1:100,1)) %>% summarize(basket_price = sum(price), basket_weight = sum(weight)/1000)
df %>% select(name, price, weight) %>% sample_n(sample(1:100,1)) %>% summarize(basket_price = sum(price), basket_weight = sum(weight)/1000)
savehistory(file='simulate_basket_test.r')
