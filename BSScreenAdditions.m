//
//  NSScreenAdditions.m
//  BSScreenAdditions
//
//  Created by Karsten Kusche on 03.08.11.
//  Copyright 2011 Briksoftware.com. All rights reserved.
//

#import "BSScreenAdditions.h"
#import <IOKit/graphics/IOGraphicsLib.h>

@implementation NSScreen (BSScreenAdditions)

+ (NSScreen*)firstScreen
{
	NSArray* screens = [NSScreen screens];
	if ([screens count] == 0)
	{
		return nil;
	}
	return [screens objectAtIndex:0];
}

- (NSNumber*)screenNumber
{
	return [[self deviceDescription] objectForKey:@"NSScreenNumber"];
}

+ (NSScreen*)screenWithNumber:(NSNumber*)screenId
{
	for (NSScreen* each in [NSScreen screens])
	{
		if ([screenId isEqual:[each screenNumber]])
		{
			return each;
		}
	}
	NSLog(@"found no screen with id: %@",screenId);
	return nil;
}

- (NSString*)displayPrefsKey
{
    io_service_t framebuffer = CGDisplayIOServicePort([[self screenNumber] unsignedIntValue]);
    NSDictionary *deviceInfo = (NSDictionary *)IODisplayCreateInfoDictionary(framebuffer, kIODisplayOnlyPreferredName);
	
    NSString *prefsKey = [deviceInfo objectForKey:@"IODisplayPrefsKey"];
	prefsKey = [NSString stringWithString:prefsKey]; // create a new autoreleased string, otherwise there's a segfault
    [deviceInfo release];
    return prefsKey;    
}
@end
