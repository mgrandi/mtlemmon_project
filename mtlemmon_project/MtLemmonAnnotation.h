//
//  MtLemmonAnnotation.h
//  mtlemmon_project
//
//  Created by Benjamin Dicken on 11/27/11.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MtLemmonAnnotation : NSObject <MKAnnotation> {
    CLLocationCoordinate2D _coo;
    NSString *subtitle;  
    NSString *title; 
}

- (id)initWithCoordinate:(CLLocationCoordinate2D)loc;

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

// if the iOS version is lesser than 5.0, its retain, otherwise its copy
#if __IPHONE_OS_VERSION_MAX_ALLOWED < __IPHONE_5_0
@property (nonatomic, retain) NSString *title;
#else
@property (nonatomic, copy) NSString *title;
#endif

#if __IPHONE_OS_VERSION_MAX_ALLOWED < __IPHONE_5_0
@property (nonatomic, retain) NSString *subtitle;
#else
@property (nonatomic, copy) NSString *subtitle;
#endif

@end