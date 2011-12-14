//
//  PListLoader.m
//  mtlemmon_project
//
//  Created by Benjamin Dicken, Mark Grandi, Charles Rickards and Stefan Lindstrom on 11/27/11.
//  Copyright (c) 2011 Flandrau Science Center, UofA. All rights reserved.
//

#import "PListLoader.h"

@implementation PListLoader

- (id) init {
    if (self) {
        plDict = [[NSDictionary alloc] init];
    }
    return self;
}

-(void) dealloc {
    
    [plDict release];
    [fileName release];
    [super dealloc];
    
}

// Use this method by passing a string to it.  It will scan in a plist file 
// with the provided name to a NSDictionary
- (void) setAndScanFile: (NSString *) p 
{
    fileName = p;
    
    // get mainbundle - bundle is the groups/folders where supporting files are put in
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSString *finalPath = [mainBundle pathForResource: p ofType:@"plist"];
    plDict = [[NSDictionary dictionaryWithContentsOfFile:finalPath] retain];
}

// This method returns the String at a give index of the scanned-in plist 
- (NSString *) getStringAtIndex: (int) i 
{
    NSString *integ = [NSString stringWithFormat:@"%d", i];
    NSString *appended = [NSString stringWithFormat:@"%@%@", fileName, integ];
    return [plDict objectForKey: appended ];
}


@end
