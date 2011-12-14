//
//  Journal.m
//  mtlemmon_project
//
//  Created by Benjamin Dicken, Mark Grandi, Charles Rickards and Stefan Lindstrom on 11/27/11.
//  Copyright (c) 2011 Flandrau Science Center, UofA. All rights reserved.
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
        self.date = [NSDate date];
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
