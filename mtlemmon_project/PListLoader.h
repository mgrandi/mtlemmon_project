//
//  PListLoader.h
//  mtlemmon_project
//
//  Created by Benjamin Dicken, Mark Grandi, Charles Rickards and Stefan Lindstrom on 11/27/11.
//  Copyright (c) 2011 Flandrau Science Center, UofA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PListLoader : NSObject {
    NSDictionary *plDict;
    NSString *fileName;
}

- (void) setAndScanFile: (NSString *) p;
- (NSString *) getStringAtIndex: (int) i;

@end
