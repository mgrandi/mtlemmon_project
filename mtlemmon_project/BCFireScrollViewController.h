//
//  BCFireScrollViewController.h
//  mtlemmon_project
//
//  Created by Benjamin Dicken on 11/21/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PListLoader.h"

@interface BCFireScrollViewController : UIViewController {
    UIScrollView* scrollView;
    UIPageControl* pageControl;
    
    PListLoader* pll;
}

- (void)scrollViewDidScroll:(UIScrollView *)sender;

@property (nonatomic, retain) IBOutlet UIScrollView* scrollView;
@property (nonatomic, retain) IBOutlet UIPageControl* pageControl;
@property (assign) id<UIScrollViewDelegate> delegate;

@end