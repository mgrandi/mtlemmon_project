//
//  PListLoader.m
//  mtlemmon_project
//
//  Created by Benjamin Dicken on 11/26/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
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

// Use this method to 
- (void) setAndScanFile: (NSString *) p 
{
    fileName = p;
    
    // get mainbundle - bundle is the groups/folders where supporting files are put in
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSString *finalPath = [mainBundle pathForResource: p ofType:@"plist"];
    plDict = [[NSDictionary dictionaryWithContentsOfFile:finalPath] retain];
}

- (NSString *) getStringAtIndex: (int) i 
{
    NSString *integ = [NSString stringWithFormat:@"%d", i];
    NSString *appended = [NSString stringWithFormat:@"%@%@", fileName, integ];
    return [plDict objectForKey: appended ];
}


@end
