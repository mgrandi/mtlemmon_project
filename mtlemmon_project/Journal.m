//
//  Journal.m
//  mtlemmon_project
//
//  Created by Mark Grandi on 12/6/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Journal.h"


@implementation Journal

@synthesize journalText = _journalText;
@synthesize date = _date;
@synthesize gpsCoord = _gpsCoord;
@synthesize image = _image;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        
        self.journalText = nil;
        self.gpsCoord = nil;
        self.date = nil;
        self.image = nil;
        
    }
    
    return self;
}

-(void) dealloc {
    
    [self.journalText release];
    [self.gpsCoord release];
    [self.date release];
    [self.image release];
    [super dealloc];
    
    
}


@end
