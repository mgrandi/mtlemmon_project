//
//  IRFireScrollViewController.m
//  mtlemmon_project
//
//  Created by Patrick Rickards on 11/29/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "IRFireScrollViewController.h"

@implementation IRFireScrollViewController

@synthesize scrollView;
@synthesize pageControl;
@synthesize delegate;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *text = [NSArray arrayWithObjects:@"Some Info Here", @"Even more info", @"Bwahaha...more info", @"", nil];
    pll = [[PListLoader alloc] init];
    
    for (int i = 0; i < text.count; i++) {
        
        // create a CGSize struct to use to change the size of the ScrollView and view
        struct CGSize frameSize;
        frameSize.width = ([UIScreen mainScreen].bounds.size.width);
        frameSize.height = ( ([UIScreen mainScreen].bounds.size.height) - 44);
        
        scrollView.contentSize = frameSize;
        
        // Set up the frame location and size
        CGRect frame;
        frame.origin.x = self.scrollView.frame.size.width * i;
        frame.origin.y = 0;
        frame.size = frameSize;
        
        // Set the frame as the Subview
        UIView *subview = [[UIView alloc] initWithFrame:frame];
        [self.scrollView addSubview:subview];
        
        UIImage *bg = [UIImage imageNamed:@"background_1sm.png"];
        UIImageView *bgv = [[UIImageView alloc] initWithImage: bg];
        // add the button as a subview to the main imageview
        [subview addSubview: bgv];
        
        UILabel *myLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, ([UIScreen mainScreen].bounds.size.width - 20), ([UIScreen mainScreen].bounds.size.height - 20) )];
        
        myLabel.numberOfLines = 0; // Allows for infinite number of lines
        myLabel.lineBreakMode = UILineBreakModeWordWrap;
        
        [pll setAndScanFile: @"IRFire"];
        myLabel.text = [pll getStringAtIndex: i];
        
        myLabel.textColor = [UIColor whiteColor];
        myLabel.backgroundColor = [UIColor clearColor];
        [subview addSubview:myLabel];
        
        // release the items
        [myLabel release];
        [subview release];
    }
    
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * text.count, self.scrollView.frame.size.height-50);
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