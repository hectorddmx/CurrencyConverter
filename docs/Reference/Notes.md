# Notes
For [[Installing flutter]]
For [[Resources]]

## Getting Started  
  
This project is a starting point for a Flutter application.  
  
A few resources to get you started if this is your first Flutter project:  
  
- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)  
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)  
  
For help getting started with Flutter, view our  
[online documentation](https://flutter.dev/docs), which offers tutorials,  
samples, guidance on mobile development, and a full API reference.

## Android studio plugins for flutter
- https://plugins.jetbrains.com/plugin/12693-flutter-enhancement-suite/versions

## Good intro for iOS devs
https://flutter.dev/docs/get-started/flutter-for/ios-devs

## Configure to be able to run unsound null safety within project
* Add the following parameter in Additional args within visual studio
`--no-sound-null-safety`
![[Pasted image 20210826004014.png]]

## Styleguide
https://dart.dev/guides/language/effective-dart/style
https://dart.dev/guides/language/effective-dart/documentation

## Widgets
![[Pasted image 20210825224552.png]]
I would require some things to get this layout going:
* A card like widget
* A dropdown widget
* A textfield widget
	* Something that formats textfield input to currency
* A text widget for everything else
* A button widget

## Configure securely api key

### Not protected by reverse engineering
- https://dev.to/aadityasiva/protecting-api-keys-in-flutter-619

### Protecting it from reverse engineering
- https://stackoverflow.com/questions/64527430/how-to-protect-flutter-app-from-reverse-engineering/64543495#64543495
- https://stackoverflow.com/questions/61894868/securely-saving-api-keys-in-android-flutter-apps/61933765#61933765