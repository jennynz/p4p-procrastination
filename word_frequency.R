# Part IV Project Infographic

# Frequency of certain words in my project log over time.
# Number of lines/characters written in my project log over time.
# Probably a proxy for work done/effort expended.

rm(list=ls()) # clear workspace
graphics.off() # close all graphics windows

path <<- "/home/jenny/Documents/P4P Infographic"
setwd(path)
log.file <-file(paste(path,"projectlog.txt",sep = "/"), open = 'r')

days <- seq(as.Date("2016-04-12"), as.Date("2016-09-21"), by="days")
num.days <- length(days)

# For each of these words
good.words <- c("yay", "it worked", "ah hah", "interesting", "improve", "better", "finally", "hmm")	
bad.words <- c("error", "bug", "missing", "don't know", "not sure", "argh", "poo", "shit") 
words <- c(good.words, bad.words)
num.words <- length(good.words)+ length(bad.words)

wordfreq.df <- data.frame(matrix(ncol = num.words, nrow = num.days, data = 0))
rownames(wordfreq.df) <- days
colnames(wordfreq.df) <- c(good.words, bad.words)

charcount.df <- data.frame(matrix(ncol = 2, nrow = num.days, data = 0))
rownames(charcount.df) <- days
colnames(charcount.df) <- c("chars", "chars_cumu")

# Initialise Characters per day, and characters cumulative
chars <- 0
chars_cumu <- 0

# Scan through .tex file line by line
linn <-readLines(log.file)
first.day <- T
for (i in 1:length(linn)) {
  
  this.line <- linn[i]
  this.line.chars <- nchar(this.line)
  chars <- chars + this.line.chars
  chars_cumu <- chars_cumu + this.line.chars
  
  # Update date when /section*{ pattern occurs
  if (grepl("[\\]section\\*", this.line)) {
    
    if (first.day == F) {
      # Store all the previous characters from the last day into df
      charcount.df[current.date, "chars"] <- chars
      charcount.df[current.date, "chars_cumu"] <- chars_cumu
      
      # Also reset characters counter for next day
      chars <- 0
    } else {
      # Disregard front matter, before first entry
      chars <- 0
      chars_cumu <- 0
      first.day <- F
    }
    
    # Onto the next day
    current.date <- unlist(strsplit(this.line, ''))[11:20]
    y <- paste(current.date[7:10], collapse="")
    m <- paste(current.date[4:5], collapse="")
    d <- paste(current.date[1:2], collapse="")
    current.date <- paste(y, m, d, sep="-")
  
  }
  
  # If word is found, increase tally in data frame for that date by 1
  for (w in words) {
    if (grepl(w, this.line, ignore.case = T)) {
      wordfreq.df[current.date, w] <- wordfreq.df[current.date, w] + 1
    }
  }
  
}

write.csv(wordfreq.df, file = "word_frequency.csv")
write.csv(charcount.df, file = "char_count.csv")

close(log.file)

# WORD FREQUENCY GRAPH

library("RColorBrewer")
cols <- c(rev(brewer.pal(length(good.words), "Blues")), rev(brewer.pal(length(bad.words), "Reds")))
max.freq <- max(wordfreq.df)
plot(wordfreq.df[,words[1]]~days, type="l", bty="l", xlab="Date", ylab="Frequency",
     col=cols[1] , lwd=3 , pch=17 , ylim=c(0,max.freq), yaxt="n")
axis(2, at=0:max.freq, labels=0:max.freq, las=2)
for (i in 2:length(words)) {
  lines(wordfreq.df[,words[i]]~days, col=cols[i], lwd=3, pch=19)  
}

# Add a legend
legend("bottomleft", 
       legend = words, 
       col = cols,
       bty = "n", 
       pt.cex = 2, 
       cex = 1.2, 
       text.col = cols, 
       horiz = F,
       inset = c(0.02, 0.5))

# Title
title("Instances of certain words in my project log\nleading up to the deadline")

# WORD FREQUENCY CUMULATIVE

wordfreq.cumu.df <- cumsum(wordfreq.df)
max.freq <- max(wordfreq.cumu.df)
plot(wordfreq.cumu.df[,words[1]]~days, type="l", bty="l", xlab="Date", ylab="Frequency",
     col=cols[1] , lwd=2 , pch=17 , ylim=c(0,max.freq), yaxt="n")
axis(2, at=0:max.freq, labels=0:max.freq, las=2)
for (i in 2:length(words)) {
  lines(wordfreq.cumu.df[,words[i]]~days, col=cols[i], lwd=2, pch=19)  
}

# Add a legend
legend("bottomleft", 
       legend = words, 
       col = cols,
       bty = "n", 
       pt.cex = 2, 
       cex = 1.2, 
       text.col = cols, 
       horiz = F,
       inset = c(0.02, 0.1))

# Title
title("Cumulative count of certain words in my project log\nleading up to the deadline")

# NUM CHARACTERS GRAPH

par(mfrow=c(2,1)) 

plot(charcount.df$chars~days, type="l", bty="l", xlab="Date", ylab="Frequency",
     col="palegreen2", lwd=2 , pch=17 , ylim=c(0,max(charcount.df$chars)), ann=F) #, yaxt="n"
title("Number of characters written\nin project log each day")

plot(charcount.df$chars_cumu~days, type="l", bty="l", xlab="Date", ylab="Frequency",
     col="palegreen3", lwd=2 , pch=17 , ylim=c(0,max(charcount.df)), ann=F)
title("Cumulative characters written in project log")
#axis(2, at=0:max.chars, labels=0:max.chars, las=2)
