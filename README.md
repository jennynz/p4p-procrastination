# Bachelor of Procrastination (Honours)

An analysis of my levels of panic and procrastination during [my final year engineering project](https://github.com/jennynz/VTshapes), using my research project log book and the repository's git log as data.

I spent an afternoon one summer's day tinkering on R, trying to brush up on the syntax and such. I thought it'd be a spiffing idea to try plotting the number of exclamations of joy ("Yay!", "It worked!") vs. exclamations of frustration ("argh", "poo") written in my final year engineering project log, over time. My hypothesis was that it would correlate with the number of characters written in my project log, and the number of git commits made at unreasonably late hours, over time. *I wanted to paint the quintessential picture of panic and procrastination that is at least somewhat familiar to all Part IV students at the Department of Engineering Science.*

## How much I wrote in my project log book over time

<p align="center">
<img width="80%" alt="The number of characters written into my research project log each day, from the start of my project up to the deadline." src="https://github.com/jennynz/p4p-procrastination/blob/master/plots/charcount_annotated.png"/>
</p>

It appears that I wasn't too bad leaving things until the last minute, or not as bad as it felt, if the character count of my project log book is indeed an accurate scientific measure of the amount of work I actually did (which, you know, it isn't). Intriguingly, the cumulative character count does seem to show the beginnings of exponential growth. Perhaps if/when I do a PhD, I can test this theory over a longer time period and see if I'm truly a slave to [The Instant Gratification Monkey & Panic Monster](http://waitbutwhy.com/2013/10/why-procrastinators-procrastinate.html). That sounds like a fun experiment.

EDIT: I later realised that Github's Code frequency graph basically does this anyway, but with the entire repo instead of just the project log, which is probably more accurate. Oh well, I brushed on up my R.

## Whether I kept up my positivity throughout the project, or spiraled into stress and despair as the deadline approached.

<p align="center">
<img width="80%" alt="Frequency of certain words in my project log leading up to the deadline." src="https://github.com/jennynz/p4p-procrastination/blob/master/plots/wordfreq_annotated.png"/>
</p>

Well, it looks like there is little correlation between the number of mild profanities used vs. time left until deadline. In fact, my language was so mild, and my commits relatively sparse, that the results quite frankly look like they're barely worth plotting. I kind of hoped that it would look more convincingly panick-stricken, for comedic purposes. Alas. Perhaps I could ask my fellow classmates for their git repos, and offer to analyse theirs as well (although my project-log-analyser requires a consistent date format at the start of each day's entry), because who doesn't want to see the blood, sweat and tears of their labour, rendered as a beautiful infographic? Right? The search phrases do need to be tailored to each individual's unique style of self-expression in the face of endless errors, hours of debugging, lack of sleep, bad hygiene and poor eating habits.

I also found that choosing the right search phrases was tricky, because the string matching needed to be a bit fuzzy (not case sensitive, can be part of a word like _hmm_ and _hmmm_), but make it too general, and you can context errors. For example, _great_ could be in the context of "not too _great_", _error_ could have occurred while saying "I fixed the _error_". Perhaps an opportunity to try out some NLP, labelling phrases as positive or negative depending on their context. But also a rather pointless application of NLP. 

## How my working hours changed as I neared doomsday

<p align="center">
<img width="80%" alt="Word cloud of key worsd in my project log" src="https://github.com/jennynz/p4p-procrastination/blob/master/plots/commit-times.png"/>
</p>

This is basically Github's punchcard, only it unravels the commits over dates as well.

## Word cloud

<p align="center">
<img width="80%" alt="Word cloud of key worsd in my project log" src="https://github.com/jennynz/p4p-procrastination/blob/master/plots/wordcloud.png"/>
</p>

This word cloud was generated just by following [this tutorial](http://www.sthda.com/english/wiki/text-mining-and-word-cloud-fundamentals-in-r-5-simple-steps-you-should-know). 	

 Well, this was pointless yet mildly satisfying! Now that I feel like I've brushed up on R a little, I can leave the realm of weird assignment operators in search of better coding projects.