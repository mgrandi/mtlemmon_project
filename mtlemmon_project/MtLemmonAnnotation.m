//
//  MtLemmonAnnotation.m
//  mtlemmon_project
//
//  Created by Benjamin Dicken, Mark Grandi, Charles Rickards and Stefan Lindstrom on 11/27/11.
//  Copyright (c) 2011 Flandrau Science Center, UofA. All rights reserved.
//

#import "MtLemmonAnnotation.h"

@implementation MtLemmonAnnotation

@synthesize coordinate = _coo;
@synthesize title = title;
@synthesize subtitle = subtitle;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (id)initWithCoordinate:(CLLocationCoordinate2D)loc {
    self = [super init];
    if (self) {
        _coo = loc;
    }
    return self;
}

-(void) dealloc {
    
    [subtitle release];
    [title release];
    [super dealloc];
    
    
}




@end
