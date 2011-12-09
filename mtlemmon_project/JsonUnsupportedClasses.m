//
//  JsonUnsupportedClasses.m
//  mtlemmon_project
//
//  Created by Mark Grandi on 12/9/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "JsonUnsupportedClasses.h"
#import "NSData+Base64.h"
#import "Journal.h"

// basically, this class just has a static method which JSONData:serializeUnsupportedClassesWithDelegate
// calls.
@implementation JsonUnsupportedClasses

// gets called by Jsonkit if it tries to seralize a class that it can't do on its own
+(id) serializeUnsupported:(id)object {
    
    if ([object isKindOfClass:[NSDate class]]) {
        
        // *************
        // NSDate objects
        // *************
        
        // return this as a string, using timeIntervalSince1970
        
        NSDate *tmpDate = (NSDate *)object;
        
        // timeIntervalSince1970 returns a NSTimeInterval, aka a double
        return [NSString stringWithFormat:@"%d", [tmpDate timeIntervalSince1970]];
       
        
    } else if ([object isKindOfClass:[CLLocation class]]) {
        
        // *************
        // CLLocation objects
        // *************
        
        CLLocation *tmpLoc = (CLLocation *)object;
        
        // these are complicated, haha. need to save enough information to use:
        //– initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:speed:timestamp:
        // and some of these are structs too
        
        NSMutableDictionary *clResultDict = [NSMutableDictionary dictionary];
        
        //
        // coordinate:
        //
        // typedef struct {
        //     CLLocationDegrees latitude;
        //     CLLocationDegrees longitude;
        // } CLLocationCoordinate2D;
        //
        //typedef double CLLocationDegrees;
        NSMutableDictionary *coordDict = [NSMutableDictionary dictionary];
        [coordDict setValue:[NSString stringWithFormat:@"%d",tmpLoc.coordinate.latitude]  forKey:@"latitude"];
        [coordDict setValue:[NSString stringWithFormat:@"%d",tmpLoc.coordinate.longitude]  forKey:@"longitude"];
        // add it to the result dict
        [clResultDict setValue:coordDict forKey:@"coordinate"];
        
        
        // altitude:
        // typedef double CLLocationDistance;
        
        [clResultDict setValue:[NSString stringWithFormat:@"%d", tmpLoc.altitude] forKey:@"altitude"];
        
        
        // horiz accuracy
        // typedef double CLLocationAccuracy;
        [clResultDict setValue:[NSString stringWithFormat:@"%d", tmpLoc.horizontalAccuracy] forKey:@"horizontalAccuracy"];
         
         
        // vertical accuracy
        [clResultDict setValue:[NSString stringWithFormat:@"%d", tmpLoc.verticalAccuracy] forKey:@"verticalAccuracy"];
        
        // course
        // typedef double CLLocationDirection;
        [clResultDict setValue:[NSString stringWithFormat:@"%d", tmpLoc.course] forKey:@"course"];
        
        // speed
        // typedef double CLLocationSpeed;
        [clResultDict setValue:[NSString stringWithFormat:@"%d", tmpLoc.speed] forKey:@"speed"];
        
        // timestamp (NSDate)
        [clResultDict setValue:tmpLoc.timestamp forKey:@"timestamp"];
        
        // return the dictionary
        return clResultDict;
        
    
    } else if ([object isKindOfClass:[UIImage class]]) {
        
        // *************
        // UIImage objects
        // *************
        
        // here we just return the base64 encoded image as a string.
        
        UIImage *tmpImg = (UIImage *)object;
        
        // get the image as png bytes
        NSData *img = UIImageJPEGRepresentation(tmpImg, 0.9);
        
        NSString *imgStr = [img base64EncodedString];
        
        return imgStr;
        
    } else if ([object isKindOfClass:[Journal class]]) {
        
        // *************
        // UIImage objects
        // *************
        
        // just return a dictionary with all of the properties in it
        // NSString *_journalText;
        // NSDate *_date;
        // CLLocation *_gpsCoord;
        // UIImage *_image;
        
        Journal *tmpJournal = (Journal *)object;
        
        NSMutableDictionary *journalDict = [NSMutableDictionary dictionary];
        
        [journalDict setValue:tmpJournal.journalText forKey:@"journalText"];
        [journalDict setValue:tmpJournal.date forKey:@"date"];
        [journalDict setValue:tmpJournal.gpsCoord forKey:@"gpsCoord"];
        [journalDict setValue:tmpJournal.image forKey:@"image"];
        
        return journalDict;
        
    }
    
    // *****************
    // Every other object
    // *****************
    
    // if we get here, then its some other object, we just say its unsupported.
    
    return [NSArray arrayWithObject:[NSString stringWithString:@"Unsupported object"]];
    
}

@end
