//
//  Journal.h
//  mtlemmon_project
//
//  Created by Benjamin Dicken, Mark Grandi, Charles Rickards and Stefan Lindstrom on 11/27/11.
//  Copyright (c) 2011 Flandrau Science Center, UofA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>


// so, what does a journal entail?
//
// it should have:
//      text the user enters
//      date
//      gps coordinates if able
//      image if able


@interface Journal : NSObject {
    
    
    NSString *_journalText;
    NSDate *_date;
    CLLocation *_gpsCoord;
    UIImage *_image;
    
    
}

@property (nonatomic, retain) NSString *journalText;
@property (nonatomic, retain) NSDate *date;
@property (nonatomic, retain) CLLocation *gpsCoord;
@property (nonatomic, retain) UIImage *image;

@end
