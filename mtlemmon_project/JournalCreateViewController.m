//
//  JournalCreateViewController.m
//  mtlemmon_project
//
//  Created by Mark Grandi on 12/3/11.
//  Copyright (c) 2011 Flandrau Science Center, UofA. All rights reserved.
//

#import "JournalCreateViewController.h"
#import <QuartzCore/QuartzCore.h>


// so, what does a journal entail?
//
// it should have:
//      text the user enters
//      date
//      gps coordinates if able
//      image if able

@implementation JournalCreateViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        

        
        
        // add the "take photo" button to the navigation bar
        UIBarButtonItem *cameraButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemCamera target:self action:@selector(cameraButtonClicked:)];
        
        [[self navigationItem] setRightBarButtonItem:cameraButton];
        [cameraButton release];
        
        
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

// gets called when the OK button gets clicked.
-(IBAction)okButtonPressed:(id)sender {
    
    
    
    
    
}

// gets called when the camera button (the right button on the UINavigationBar) 
// gets clicked
-(void)cameraButtonClicked:(id) sender {
    
    
    NSLog(@"camera button clicked");
    
}

// delegate method for UITextView, gets called when the user is done editing text
-(void) textViewDidEndEditing:(UITextView *)textView {
    
    NSLog(@"text editing done");
    
}

// delegate method for UITextView, gets called when the user types something into the keyboard
// and we return whether we want to replace it or not.
// since the keyboard's return button is "done" here, if the user types a '\n' then we resign first responder and dismiss the keyboard.
-(BOOL) textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
        
    if ([text isEqualToString:@"\n"]) {
        
        // dismiss the keyboard
        [textView resignFirstResponder];
        
        return NO;
        
        
    } else {
        
        // for any other key besides "done", we want it to be applied so we say yes
        return YES;
        
    }
    
}

#pragma mark - View lifecycle

-(void)viewWillAppear:(BOOL)animated {
    
    // this is here instead of viewDidAppear so we don't get the contents resizing when they 
    // see the screen.
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    
    // uitextview stuff
    [theTextView.layer setBackgroundColor: [[UIColor whiteColor] CGColor]];
    [theTextView.layer setBorderColor: [[UIColor grayColor] CGColor]];
    [theTextView.layer setBorderWidth: 1.0];
    [theTextView.layer setCornerRadius:8.0f];
    [theTextView.layer setMasksToBounds:YES];
    
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
