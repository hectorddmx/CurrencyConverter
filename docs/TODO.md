# TODO
## Setup environment
- [x] Install Flutter  
	Check in Bear [[Frontend SW: Take Home Challenge]]
- [x] Fix issues with environment
- [x] Check about formatter
- [x]   Review instructions
- [x]   Check if it's fine that https://openrates.io redirects to https://exchangeratesapi.io/
- [x]   Pay for the subscription for the API or I won't be able to finish it
	- (API usage for conversion is a paid benefit)
- [x]   Check how to write some code
- [x]   Check how to create widgets with state

---

## <u>Design guidelines</u>
###   Use the JSON API from [http://openrates.io/](http://exchangeratesapi.io/) to pull up-to-date exchange rate data for performing the conversion calculation.
- [x]   Fetch [openrates.io](http://openrates.io/) API key
- [x]   Add key to dotfiles
- [x]   Review API calls
- [x]   Implement GET [[API/Symbols]]  for available currency types
	- [x]   Parse symbols response
	- [x]   Test that the response can be converted back and forth
- [x]   Implement GET [[API/Convert]] to convert from one currency to another
	- [x]   Parse convert response
	- [x]   Test that the response can be converted back and forth
- [ ]   Inject data to the drop down
- [ ]   Inject data to the bottom section to convert the default to/from currencies and default amount
### Show a drop down menu for selecting a primary currency, and another drop down menu for selecting a secondary currency.
- [x]  Check how to make constants
- [x]  Check how to implement async await, promises or callbacks 
- [ ]  Check how to manage state
- [ ]  Filter out the currency we're converting from... from the list of the dropdown of the currency to convert to so we cannot chose the same one twice .


### Bonus points for providing a button to swap the position of the starting and exchange currencies, and recomputing the conversion (as seen below).

- [x] Add button
- [x] Add similar icon
- [x] Add sample event
- [ ] Add event to switch currencies
- [ ] Migrate to MVVM with ChangeNotifier to notify of model changes

### Perform validation on keyboard input so only numbers can be entered, and reject dashes, characters, symbols, etc.
- [x] Add numeric keyboard
- [x] Add a format mask or regex so no input other than numbers, commas and dots are handled
- [x] Done



### Bonus points for implementing the specific design 
![[Pasted image 20210825224552.png]]
> Here is an example of what a currency conversion widget might look like. Bonus points for implementing this specific design
- [ ] Search how to do clipping or path painting
	- [ ] https://www.raywenderlich.com/7560981-drawing-custom-shapes-with-custompainter-in-flutter
	- [ ] Can also export from figma an SVG and import it here to generate a custom painter https://fluttershapemaker.com/
```xml
<svg width="365" height="337" viewBox="0 0 365 337" fill="none" xmlns="http://www.w3.org/2000/svg">
<path opacity="0.3" fill-rule="evenodd" clip-rule="evenodd" d="M20 0C8.95431 0 0 8.9543 0 20V142C0 153.046 8.95432 162 20 162H257.973C262.19 145.996 279.629 134 300.5 134C321.371 134 338.81 145.996 343.027 162H345C356.046 162 365 153.046 365 142V20C365 8.95431 356.046 0 345 0H20Z" fill="white"/>
<path opacity="0.3" fill-rule="evenodd" clip-rule="evenodd" d="M257.519 175L20 175C8.95431 175 0 183.954 0 195V317C0 328.046 8.95432 337 20 337H345C356.046 337 365 328.046 365 317V195C365 183.954 356.046 175 345 175H343.481C340.242 191.994 322.232 205 300.5 205C278.768 205 260.758 191.994 257.519 175Z" fill="white"/>
<circle cx="300" cy="169" r="27" fill="white"/>
</svg>
```
This SVG represents this:
![[Pasted image 20210826092515.png]]
![[Pasted image 20210826092547.png]]

# Later
- [ ] Encrypt API_KEY so it can't be easily extracted from device or IPA/APK