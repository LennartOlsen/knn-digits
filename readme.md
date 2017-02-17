## Using KNN for prediction of handwritten ciphers in R.
Created for the course statistical machine learning at University of southern denmark.
_Disclaimer : Times are not exact as the computer is the tests are done on are used while testing_

###Excersise 1:
Initial tests with 300 dpi took quite some time as seen in rplot-dpi300-gr12.png.
The speeds are in this case minutes, eg 6.3 mintues for k=1, that amounts to a total of < 10 hours of run time. Later results are produced with just 100 dpi to keep runtimes lower.
The initial (k=1) accuracy is ~79%.

---

###Excersise 2:
The plot refered to in Excersise 1 also examplifies what happens when a higher K is added. With K=2 we see that the accuracy is dropping a bit more than on every other K drop, this behaviour is present throughout all of my tests, i belive that its because of KNN algorithm having to pick a value with every value.

Interrestingly we see that the accuraccy is falling but the execution time is pretty much the same throughout the test (the higher numbers initially is due to cpu throtteling as i was still using my computer the first few hours of the run)

---

###Excersise 3:
Cross validation is done using the K fold algorithm with a sliding window technique for 10 K's with 10 folds each. The sliding window technique is that i select the first 0-10% for testing and train against the remaining 90%, then i slide my window to 10-20% for testing and test agains 0-10% + 20-90%.

The results can be seen in Rplot-dpi100-gr12-10fold-only-acc.png, as we can see my mean accuracy is much higher than before, 85%, with a standard deviation of roughly 1.6%.
The performance did drop dramatically and i was not able to test it for this exact task.

---

###Excersise 4:
The gaussian distribution smoothing test with a 10-fold run produces worse results than the original smoothing method with accuracies dropping to around 72.5% with a standard deviation of ~2.4%. The results can be seen in Rplot-dpi100-gr12-10fold-gaussian-smooth.png.

*Missing Excersise 4, average over four smoothing*

---

###Excersise 5 :
Due to high running times and bad data i was only able to include group12,group10,group1,group2 in my tests for this exercise.
See picture Rplot-100dpi-gr10+12+1+2-k10-gaussian-21.png for reference

I know that:
group12 (1 member) on its own produces an accuracy of roughly ~79%, 
group10 (1 member) produces an accuracy of ~98%
group1 (3 members) produces an accuracy of ~78%
group2 (3 members) produces an accuracy of ~82%

Combined we see a aacuracy of ~79.5% so we are edgding towards the lowest common denominator. Of course we all write numbers in different ways, and results are very prone to bad scannings and so on.
If i was able to add even more data and not bound by my local resources i could have included even more data, i think this would improve the results even more, this test only includes the handwriting of 8 different people, which is not a representetive sample of different handwriting styles.

Testing just group 10 and 12 combined gave results of 84%