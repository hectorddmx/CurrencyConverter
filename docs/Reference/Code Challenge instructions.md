# Code Challenge instructions
Frontend SW Take Home Challenge

Link to this page: [[Code Challenge instructions]]

#dart, #flutter, #codeChallenge


> ⏰ You should expect to need no more than 6 hours to solve this problem, but we will be giving you 24 hours to submit your code, with the clock starting from the time we sent you this challenge. We strongly suggest implementing a quick and dirty method before attempting to build a more elegant solution.

Your objective is to build a simple currency conversion widget using Flutter, Google's cross platform UI framework. You are not expected to have any prior experience with Flutter or the programming language Dart. If you have never heard of Flutter before, you should visit https://flutter.dev/ to get started with their tutorial and step-by-step instructions for setting up your IDE and how to configure the iOS or Android device simulator. Setting up your machine to run Flutter should not take more than 1 hour.

In addition to evaluating the optimality of your solution, and the efficiency, modularity, and readability of your code,  _we are most interested in your ability to pick up something new and unfamiliar and run as far as you can, given minimal instructions._

Your submission will be expected to build into an executable app for iOS, Android, or the Web - please specify whichever you prefer. You can submit your solution as a zip file or via Github. If you have any additional build instructions, please provide a README file with your submission as well.


## Design guidelines
- [ ] Use the JSON API from [http://openrates.io/](http://exchangeratesapi.io/) to pull up-to-date exchange rate data for performing the conversion calculation.
- [ ] Show a drop down menu for selecting a primary currency, and another drop down menu for selecting a secondary currency.
- [x] Perform validation on keyboard input so only numbers can be entered, and reject dashes, characters, symbols, etc.
- [ ] Bonus points for providing a  button to swap the position of the starting and exchange currencies, and recomputing the conversion (as seen below).

![[Pasted image 20210825224552.png]]
> Here is an example of what a currency conversion widget might look like. Bonus points for implementing this specific design

