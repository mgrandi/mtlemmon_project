//
//  TourStops.h
//  mtlemmon_project
//
//  Created by Patrick Rickards on 12/13/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PListLoader.h"

@interface TourStops : UIViewController {
    UIScrollView* scrollView;
    UIPageControl* pageControl;
    NSString* stop;
    
}

- (void)scrollViewDidScroll:(UIScrollView *)sender;
- (void)setStop:(NSString *)setter;

@property (nonatomic, retain) NSString *stop;
@property (nonatomic, retain) IBOutlet UIScrollView* scrollView;
@property (nonatomic, retain) IBOutlet UIPageControl* pageControl;
@property (assign) id<UIScrollViewDelegate> delegate;

@end