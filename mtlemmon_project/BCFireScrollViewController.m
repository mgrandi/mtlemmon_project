//
//  BCFireViewController.m
//  mtlemmon_project
//
//  Created by Benjamin Dicken on 11/21/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "BCFireScrollViewController.h"

@implementation BCFireScrollViewController

@synthesize scrollView;
@synthesize pageControl;
@synthesize delegate;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIColor *color = [[UIColor alloc] initWithRed:90.0/100.0 green:85.0/100.0 blue:80.0/100.0 alpha:1.0];
    NSArray *text = [NSArray arrayWithObjects:@"Some Info Here", @"Even more info", @"Bwahaha...more info", nil];
    NSArray *views = [NSArray arrayWithObjects: nil, nil, nil, nil];
    
    for (int i = 0; i < text.count; i++) {
        CGRect frame;
        frame.origin.x = self.scrollView.frame.size.width * i;
        frame.origin.y = 0;
        frame.size = self.scrollView.frame.size;
        
        UIView *subview = [[UIView alloc] initWithFrame:frame];
        subview.backgroundColor = color;
        [self.scrollView addSubview:subview];
        
        UILabel *myLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 200, 100)];
        myLabel.text =[text objectAtIndex:i];
        myLabel.backgroundColor = [UIColor clearColor]; // [UIColor brownColor];
        [subview addSubview:myLabel];
        
        // release the items
        [myLabel release];
        [subview release];
    }
    
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * text.count, self.scrollView.frame.size.height);
}

- (void)scrollViewDidScroll:(UIScrollView *)sender {
    // Update the page when more than 50% of the previous/next page is visible
    CGFloat pageWidth = self.scrollView.frame.size.width;
    int page = floor((self.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    self.pageControl.currentPage = page;
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.scrollView = nil;
}

- (void)dealloc {
    [scrollView release];
    [super dealloc];
}

@end