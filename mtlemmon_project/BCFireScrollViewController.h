//
//  BCFireScrollViewController.h
//  mtlemmon_project
//
//  Created by Benjamin Dicken on 11/21/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BCFireScrollViewController : UIViewController {
    UIScrollView* scrollView;
    UIPageControl* pageControl;
}

@property (nonatomic, retain) IBOutlet UIScrollView* scrollView;
@property (nonatomic, retain) IBOutlet UIPageControl* pageControl;

- (IBAction)changePage;

@end