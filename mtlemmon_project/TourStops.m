//
//  TourStops.m
//  mtlemmon_project
//
//  Created by Patrick Rickards on 12/13/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "TourStops.h"

@implementation TourStops

@synthesize scrollView;
@synthesize pageControl;
@synthesize delegate;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    NSArray *text = [[NSArray alloc] init];
    if (stop == @"BCFire"){
         text = [NSArray arrayWithObjects:@"page1", nil];
    }
    else if (stop == @"BCLifeZones"){
         text = [NSArray arrayWithObjects:@"page1", nil];
    }
    else if (stop == @"MCGeoHistory"){
         text = [NSArray arrayWithObjects:@"page1",@"page2", nil];
    }
    else if (stop == @"MCLifeZones"){
         text = [NSArray arrayWithObjects:@"page1",@"page2", nil];
    }
    else if (stop == @"WPLifeZones"){
         text = [NSArray arrayWithObjects:@"page1", nil];
    }
    else if (stop == @"WPBasin"){
         text = [NSArray arrayWithObjects:@"page1", @"page2", @"page3", nil];
    }
    else if (stop == @"WPGeology"){
         text = [NSArray arrayWithObjects:@"page1", nil];
    }
    else if (stop == @"IRFire"){
         text = [NSArray arrayWithObjects:@"page1", nil];
    }
    else if (stop == @"IRLifeZones"){
         text = [NSArray arrayWithObjects:@"page1", nil];
    }
    else if (stop == @"IRGeology"){
         text = [NSArray arrayWithObjects:@"page1",@"page2",@"page3",@"page4", nil];
    }
    
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
        if (stop == @"BCFire")
            frame.origin.y = 80;
        else if (stop == @"BCLifeZones")
            frame.origin.y = -70;
        else if (stop == @"MCGeoHistory")
            frame.origin.y = 40;
        else if (stop == @"MCLifeZones")
            frame.origin.y = -100;
        else if (stop == @"WPLifeZones" || stop == @"WPBasin")
            frame.origin.y = -50;
        else if (stop == @"WPGeology")
            frame.origin.y = 50;
        else if (stop == @"IRGeology")
            frame.origin.y = 0;
        else if (stop == @"IRFire")
            frame.origin.y = 70;
        else if (stop == @"IRLifeZones")
            frame.origin.y = -40;
        
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
        
        if (stop == @"BCFire")
            [pll setAndScanFile: @"BCFire"];
        else if (stop == @"BCLifeZones")
            [pll setAndScanFile: @"BCLifeZones"];
        else if (stop == @"MCGeoHistory")
            [pll setAndScanFile: @"MCGeoHistory"];
        else if (stop == @"MCLifeZones")
            [pll setAndScanFile: @"MCLifeZones"];
        else if (stop == @"WPLifeZones")
            [pll setAndScanFile: @"WPLifeZones"];
        else if (stop == @"WPBasin")
            [pll setAndScanFile: @"WPBasin"];
        else if (stop == @"WPGeology")
            [pll setAndScanFile: @"WPGeology"];
        else if (stop == @"IRFire")
            [pll setAndScanFile: @"IRFire"];
        else if (stop == @"IRLifeZones")
            [pll setAndScanFile: @"IRLifeZone"];
        else if (stop == @"IRFire")
            [pll setAndScanFile: @"IRFire"];
        else if (stop == @"IRGeology")
            [pll setAndScanFile: @"IRGeology"];
        myLabel.text = [pll getStringAtIndex: i];
        
        myLabel.textColor = [UIColor whiteColor];
        myLabel.backgroundColor = [UIColor clearColor];
        [subview addSubview:myLabel];
        
        // release the items
        [pll release];
        [text release];
        [myLabel release];
        [subview release];
    }
    
    // ************
    
    // create the picture to compliment the text for the stops with pictures
    if (stop == @"BCFire"){
        UIImageView *PineView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"PonderosaPine.png"]];
        [PineView setFrame:CGRectMake(0,0,self.scrollView.frame.size.width,240)]; //Adjust X,Y,W,H as needed
        [[self view] addSubview:PineView];
        [PineView release], PineView=nil;
    }
    else if (stop == @"MCGeoHistory"){
        UIImageView *GneissView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"GneissRock.png"]];
        [GneissView setFrame:CGRectMake(0,0,self.scrollView.frame.size.width,150)]; //Adjust X,Y,W,H as needed
        [[self view] addSubview:GneissView];
        [GneissView release], GneissView=nil;
    }
    else if (stop == @"WPGeology"){
        UIImageView *PineView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Hoodoo.png"]];
        [PineView setFrame:CGRectMake(0,0,self.scrollView.frame.size.width,240)]; //Adjust X,Y,W,H as needed
        [[self view] addSubview:PineView];
        [PineView release], PineView=nil;
    }
    else if (stop == @"IRFire"){
        UIImageView *PineView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"IRFireImg.png"]];
        [PineView setFrame:CGRectMake(0,0,self.scrollView.frame.size.width,240)]; //Adjust X,Y,W,H as needed
        [[self view] addSubview:PineView];
        [PineView release], PineView=nil;
    }
    
    // **********
    
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * text.count, self.scrollView.frame.size.height-50);
}

- (void)scrollViewDidScroll:(UIScrollView *)sender {
    // Update the page when more than 50% of the previous/next page is visible
    CGFloat pageWidth = self.scrollView.frame.size.width;
    int page = floor((self.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    self.pageControl.currentPage = page;
}

//to differentiate between stops
- (void)setStop:(NSString *)setter{
 //   stop = [[NSString alloc] init];
    stop = setter;
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
 //   [stop release];
    [super dealloc];
}

@end