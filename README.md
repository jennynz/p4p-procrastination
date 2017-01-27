# Bachelor of Procrastination (Honours)

An analysis of my levels of panic and procrastination during [my final year engineering project](https://github.com/jennynz/VTshapes), using project log and git log as data.

I spent an afternoon one summer's day tinkering on R, trying to plot the number of exclamations of joy ("Yay!", "It worked!") vs. exclamations of frustration ("argh", "poo", "hmm") written in my final year engineering project log, over time. My hypothesis was that it would correlate with the number of characters written in my project log, and the number of git commits made at unreasonably late hours, over time. *I wanted to paint the quintessential picture of panic and procrastination that is at least somewhat familiar to all Part IV students at the Department of Engineering Science.*

<img align="center" width="80%" alt="The number of characters written into my research project log each day, from the start of my project up to the deadline." src="https://github.com/jennynz/p4p-procrastination/blob/master/plots/charcount_annotated.png"/>

<img align="center" width="80%" alt="Frequency of certain words in my project log leading up to the deadline." src="https://github.com/jennynz/p4p-procrastination/blob/master/plots/wordfreq_annotated.png"/>

(Un)fortunately, it turns out that my language was very mild, and my commits relatively sparse - the results were barely worth plotting. Also, the search phrases had to be inconveniently specific, because generally positive words like "great" could be in the context of "not too _great_", and the same for words indicating poor results/confusion/frustration (e.g. "fixed the _error_"). Perhaps an opportunity to try out some NLP, labelling phrases as positive or negative depending on their context. But also a rather useless application of NLP.

However, I liked the idea, so I thought I would generate some random data and to test the scripts that way as well. Perhaps I could ask my fellow classmates for their git repos, and offer to analyse theirs as well (although my project-log-analyser requires a consistent date format at the start of each day's entry), because who doesn't want to see the blood, sweat and tears of their labour, rendered as a beautiful infographic?

[Plots with generated, more convincingly panicked-looking data here]

Currently, the outputs are just .txt and .csv files, which I then plot/render myself. The most useful/humorous script is most likely the commit-times section in `commits.R`, which is basically like Github's punchcard, only it unravels the commits over dates as well. The word cloud was simply following [this tutorial](# http://www.sthda.com/english/wiki/text-mining-and-word-cloud-fundamentals-in-r-5-simple-steps-you-should-know). The number of lines written is much more simply represented on Github's Code frequency graph anyway, and the word frequency needs to be tailored to each individual's style of self-expression in the face of endless errors, hours of debugging, lack of sleep, bad hygiene, poor eating habits, and stress.