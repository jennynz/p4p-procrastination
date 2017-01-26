# Bachelor of Procrastination (Honours)

An analysis of my levels of panic and procrastination during my final year engineering project

I spent an afternoon one summer's day tinkering on R, trying to plot the number of positive exclamations ("Yay!", "It worked!") vs. mild profanities ("argh", "poo", "hmm") written in my final year engineering project log, over time. My hypothesis was that it would correlate with the number of characters written in my project log, and the number of git commits made at unreasonably late hours, over time. I wanted to paint the quintessential picture of panic and procrastination that is at least somewhat familiar to all Part IV students at the Department of Engineering Science.

[Prettified plots to be included here]

(Un)fortunately, it turns out that my language was very mild, and my commits relatively sparse - the results were barely worth plotting. However, I liked the idea, so I thought I would generate some random data and to test the scripts that way as well. Perhaps I could ask my fellow classmates for their git repos, and offer to analyse theirs as well (although my project-log-analyser requires a consistent date format at the start of each day's entry), because who doesn't want to see the dark side of their labour in beautiful plots and pictures?.

[Plots with generated, more convincingly panicked-looking data here]

Currently, the outputs are just .txt and .csv files, which I then plot/render myself. I think the most useful/humorous script is probably `commits.R`, which is basically like Github's punchcard, only it unravels the commits over dates as well. The number of lines written is much more simply represented on Github's Code frequency graph anyway, and the word frequency needs to be tailored to each individual's style of self-expression in the face of endless errors, hours of debugging, lack of sleep, bad hygiene, poor eating habits, and stress.