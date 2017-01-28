# Part IV Project Infographic

# Time of day & number of git commits
# Also exports commit messages to space separated txt file for word cloud, then generates said word cloud.

rm(list=ls()) # clear workspace
graphics.off() # close all graphics windows

path <<- "/home/jenny/Documents/P4P Infographic"
setwd(path)
git.log <- file(paste(path,"commits.csv",sep = "/"), open = 'r')

days <- seq(as.Date("2016-04-12"), as.Date("2016-10-04"), by="days")
times <- seq(
            from=as.POSIXct("2012-1-1 0:00"),
            to=as.POSIXct("2012-1-1 23:00"),
            by="hour"
          )  

tally.df <- data.frame(matrix(ncol = length(times), nrow = length(days), data = 0))
rownames(tally.df) <- days
colnames(tally.df) <- strftime(times, format="%H") # Hours only. Use "%H:%M:%S" for mins and secs.

# Download git log in csv format with nicely formatted dates.
# git log --date=iso --pretty=format:'"%h","%an","%ad","%s"' > commits.csv
commits.df <- read.csv(file = git.log, header = FALSE)
colnames(commits.df) <- c("time", "message")

close(git.log)

# Take just the times of the commits, and populate tally df.
for (t in as.character(commits.df$time)) {
  
  # Day
  d <- unlist(strsplit(t, ''))[1:10]
  d <- paste(d, collapse="")
  
  # Time
  h <- unlist(strsplit(t, ''))[12:13]
  h <- paste(h, collapse="")
  
  tally.df[d, h] <- tally.df[d, h] + 1

}

write.csv(tally.df, file = "commits_tally.csv")

# WORD CLOUD
# http://www.sthda.com/english/wiki/text-mining-and-word-cloud-fundamentals-in-r-5-simple-steps-you-should-know

# Export messages as space-separated .txt file for word cloud processing
write(as.character(commits.df$message), file="commit_messages.txt", ncolumns = 1, append = F)

# Install
# install.packages("tm")  # for text mining
# install.package("SnowballC") # for text stemming
# install.packages("wordcloud") # word-cloud generator 
# install.packages("RColorBrewer") # color palettes
# Load
library("tm")
# library("SnowballC")
library("wordcloud")
library("RColorBrewer")

# Read the text file
text <- readLines(paste(path,"commit_messages.txt",sep = "/"))
# Load the data as a corpus
docs <- Corpus(VectorSource(text))

# Transform special characters into spaces
toSpace <- content_transformer(function (x , pattern ) gsub(pattern, " ", x))
docs <- tm_map(docs, toSpace, "/")
docs <- tm_map(docs, toSpace, "&")

# Clean up text

# Convert the text to lower case
docs <- tm_map(docs, content_transformer(tolower))
# Remove numbers
docs <- tm_map(docs, removeNumbers)
# Remove english common stopwords
docs <- tm_map(docs, removeWords, stopwords("english"))
# Remove your own stop word
# specify your stopwords as a character vector
docs <- tm_map(docs, removeWords, c("githubcomjennynz", "starting", "removing",
                                    "start", "hoodtxt", "take", "can", "take",
                                    "files", "add", "adding", "update")) 
# Remove punctuations
docs <- tm_map(docs, removePunctuation)
# Eliminate extra white spaces
docs <- tm_map(docs, stripWhitespace)
# Text stemming (Requires package SnowballC)
# docs <- tm_map(docs, stemDocument)

dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)

set.seed(12)
wordcloud(words = d$word, freq = d$freq, min.freq = 2,
          max.words=200, random.order=FALSE, rot.per=0.35, 
          colors=brewer.pal(8, "Dark2"))


