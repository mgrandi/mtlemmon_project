//
//  Journal.m
//  mtlemmon_project
//
//  Created by Mark Grandi on 12/6/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Journal.h"

@implementation Journal

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        
        //self.journalText = nil;
        journalText = nil;
        gpsCoord = nil;
        date = nil;
        
    }
    
    return self;
}

-(void) dealloc {
    
    [journalText release];
    [gpsCoord release];
    [date release];
    [super dealloc];
    
    
}


@end
