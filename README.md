# BSScreenAdditons
this project is just a bunch of convenience methods for NSScreen. 

- +(id)firstScreen 
	returns the screen with the menu bar. +mainScreen is not always that screen. [NSScreen class reference][1]
- +(id)screenWithNumber:(NSNumber*)screenId
	returns the screen that matches this number. If none is found, returns nil
- -(NSString*)displayPrefsKey
	returns the screen's IODisplayPrefsKey
- -(NSNumber*)screenNumber
	returns the screen's number

[1]: http://developer.apple.com/library/mac/#documentation/Cocoa/Reference/ApplicationKit/Classes/NSScreen_Class/Reference/Reference.html