library(dplyr)
library(stats)
library(psych)
library(ggfortify)
library(tidyverse)
library(ggplot2)
library(Hmisc)
library(PerformanceAnalytics)
library(stringr)  

library(tm)
library(SnowballC)
library(wordcloud)
library(RColorBrewer)


# Read Dataset
df<-read.csv("C:/Users/Aniket/Desktop/Assignment/zip FIle/cristiano_vs_messi (1).csv", na.strings=c(""))

# show 3 last rows
tail(df,3)

# Dataset details
str(df)

# Dataset pre-processing 

# Discover the missing values
colSums(is.na(df))

df<-na.omit(df)




# Data cleaning

# Clean the min variable
df$min<-str_replace_all(df$min, "[^[:alnum:]]", "") 
# convert the  min into numeric
df$min<-as.numeric(df$min)

table(df$min)

# make a new variable from min

df<-df %>%
  mutate(Time_Class = case_when(min <= 45 ~ 'First_Half',
                                min <= 90 ~ 'Second_Half',
                                min >= 91 ~ 'Extra_Time'))






# convert into date format and extract the year, month and weekday
df$date<-as.Date(df$date, format =  "%m/%d/%Y")

df$Weekday <- weekdays(df$date) 

df$Month<- months(df$date)

df$Year <-format(df$date, format="%Y")

df$Goal_count=1


str(df)


# plot for the type of short and their counts for each player
gd<-ggplot(df, aes(x = type, fill = player))  
gd +  geom_bar() + coord_flip()


# plot for the players in each champion league with venue 
ggplot(df, aes(x = factor(comp), fill = venue , color = player)) +
  geom_density(alpha = 0.3) +
  xlab("Competition Leagues") +
  ylab("Density") +
  ggtitle("Players in each champion league with venue")




write.csv(df, 'clean_data.csv')

# Word cloud/ tage cloud simulations

str(df)


# Create corpus
#corpus = Corpus(VectorSource(df$assisted))
corpus = Corpus(VectorSource(df$opp))
#Conversion to Lowercase
corpus = tm_map(corpus, PlainTextDocument)
corpus = tm_map(corpus, tolower)

#Removing Punctuation
corpus = tm_map(corpus, removePunctuation)

#Remove stopwords
corpus = tm_map(corpus, removeWords, c("cloth", stopwords("english")))

# Stemming
corpus = tm_map(corpus, stemDocument)

# Eliminate white spaces
corpus = tm_map(corpus, stripWhitespace)
corpus[[1]][1] 

DTM <- TermDocumentMatrix(corpus)
mat <- as.matrix(DTM)
f <- sort(rowSums(mat),decreasing=TRUE)
dat <- data.frame(word = names(f),freq=f)
head(dat, 5)

set.seed(100)
wordcloud(words = dat$word, freq = dat$freq, min.freq = 2, max.words=500, random.order=FALSE, rot.per=0.30, colors=brewer.pal(8, "Dark2"))








