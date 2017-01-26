# Part IV Project Infographic
# Number of lines/characters written in my project log over time.
# Probably a proxy for work done/effort expended.


rm(list=ls()) # clear workspace
graphics.off() # close all graphics windows

path <<- "/media/jenny/JENNY 021 265 8811/Coding/2. In Progress/P4P Infographic"
log.file <- file(paste(path,"projectlog.txt",sep = "/"), open = 'r')

days <- seq(as.Date("2016-04-12"), as.Date("2016-09-21"), by="days")
num.days <- length(days)

# For each of these words
bad.words <- c("shit", "poo", "argh", "not sure") 
good.words <- c("yay", "it worked", "hmm")	
words <- c(good.words, bad.words)
num.words <- length(bad.words) + length(good.words)

tally.df <- data.frame(matrix(ncol = num.words, nrow = num.days, data = 0))

rownames(tally.df) <- days
colnames(tally.df) <- c(bad.words, good.words)

# Scan through .tex file line by line
linn <-readLines(log.file)
for (i in 677:length(linn)) {
  
  this.line <- linn[i]
  
  # Update date when /section*{ pattern occurs
    if (grepl("[\\]section\\*", this.line)) {
      current.date <- unlist(strsplit(this.line, ''))[11:20]
      y <- paste(current.date[7:10], collapse="")
      m <- paste(current.date[4:5], collapse="")
      d <- paste(current.date[1:2], collapse="")
      current.date <- paste(y, m, d, sep="-")
    }
  
  # If word is found, increase tally in data frame for that date by 1
  for (w in words) {
    if (grepl(w, this.line, ignore.case = T)) {
      tally.df[current.date, w] <- tally.df[current.date, w] + 1
    }
  }
  
}
close(log.file)

write.csv(tally.df, file = "word_frequency.csv")
