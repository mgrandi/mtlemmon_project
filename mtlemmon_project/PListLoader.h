//
//  PListLoader.h
//  mtlemmon_project
//
//  Created by Benjamin Dicken on 11/26/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PListLoader : NSObject {
    NSDictionary *plDict;
    NSString *fileName;
}

- (void) setAndScanFile: (NSString *) p;
- (NSString *) getStringAtIndex: (int) i;

@end
