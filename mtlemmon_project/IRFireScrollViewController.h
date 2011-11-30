//
//  IRFireScrollViewController.h
//  mtlemmon_project
//
//  Created by Patrick Rickards on 11/29/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PListLoader.h"

@interface IRFireScrollViewController : UIViewController{

UIScrollView* scrollView;
UIPageControl* pageControl;

PListLoader* pll;
}

- (void)scrollViewDidScroll:(UIScrollView *)sender;

@property (nonatomic, retain) IBOutlet UIScrollView* scrollView;
@property (nonatomic, retain) IBOutlet UIPageControl* pageControl;
@property (assign) id<UIScrollViewDelegate> delegate;

@end