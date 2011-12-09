//
//  JsonUnsupportedClasses.m
//  mtlemmon_project
//
//  Created by Mark Grandi on 12/9/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "JsonUnsupportedClasses.h"

// basically, this class just has a static method which JSONData:serializeUnsupportedClassesWithDelegate
// calls.
@implementation JsonUnsupportedClasses

+(id) serializeUnsupported:(id)object {
    
    NSLog(@"getting called");
    
    return [NSArray array];
    
}

@end
