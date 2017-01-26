# Part IV Project Infographic

# Frequency of certain words in my project log over time.
# Number of lines/characters written in my project log over time.
# Probably a proxy for work done/effort expended.

rm(list=ls()) # clear workspace
graphics.off() # close all graphics windows

path <<- "/media/jenny/JENNY 021 265 8811/Coding/2. In Progress/P4P Infographic"
setwd(path)
log.file <- file(paste(path,"projectlog.txt",sep = "/"), open = 'r')

days <- seq(as.Date("2016-04-12"), as.Date("2016-09-21"), by="days")
num.days <- length(days)

# For each of these words
bad.words <- c("shit", "poo", "argh", "not sure") 
good.words <- c("yay", "it worked", "hmm")	
words <- c(good.words, bad.words)
num.words <- length(bad.words) + length(good.words)

tally.df <- data.frame(matrix(ncol = num.words + 2, nrow = num.days, data = 0))

rownames(tally.df) <- days
colnames(tally.df) <- c(bad.words, good.words, "chars", "chars_cumu")

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
      tally.df[current.date, "chars"] <- chars
      tally.df[current.date, "chars_cumu"] <- chars_cumu
      
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
      tally.df[current.date, w] <- tally.df[current.date, w] + 1
    }
  }
  
}

write.csv(tally.df, file = "word_frequency.csv")

close(log.file)
