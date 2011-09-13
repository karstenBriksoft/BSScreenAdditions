//
//  NSScreenAdditions.h
//  BSScreenAdditions
//
//  Created by Karsten Kusche on 03.08.11.
//  Copyright 2011 Briksoftware.com. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSScreen (BSScreenAdditions)

- (NSNumber*)screenNumber;
+ (NSScreen*)screenWithNumber:(NSNumber*)number;
- (NSString *)displayPrefsKey;
+ (NSScreen*)firstScreen;

@end
