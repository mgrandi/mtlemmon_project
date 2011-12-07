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
    
    
   // do something with the currentJournal obj
    
    // todo: do date and GPS coordinates!
    
    
}

// gets called when the camera button (the right button on the UINavigationBar) 
// gets clicked. presents the camera / photo library
-(void)cameraButtonClicked:(id) sender {
    
    
    NSLog(@"camera button clicked");
    
    // create the image picker and set its delegate
    imagePicker = [[UIImagePickerController alloc] init];
    [imagePicker setDelegate:self];
    
    // check to see if we have a camera
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        // set source type to camera
        [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
        
    } else {
        
        // set it to photo library if we don't have a camera
        [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        
    }
    
    // show the modal interface
    [self presentModalViewController:imagePicker animated:YES];
    
}

// delegate method, gets called when the UIImagePickerController is done taking an 
// image / picking an image
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    
    UIImage *image = (UIImage *) [info objectForKey:UIImagePickerControllerOriginalImage];
    
    NSLog(@"image picker got an image");
    NSLog(@"image is: %@", image);
    
    // set the current journal's image
    [currentJournal setImage:image];
    
    // set the image on the image view
    [theImageView setImage:image];
    

    // dismiss the image picker and release it
    [self dismissModalViewControllerAnimated:YES];
    [imagePicker release];
    
}

// delegate method, gets called when the UIImagePickerController cancels
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    NSLog(@"image picker canceled");
    
    // dismiss the image picker and release it.
    [self dismissModalViewControllerAnimated:YES];
    [imagePicker release];
    
    
}

// delegate method for UITextView, gets called when the user is done editing text
-(void) textViewDidEndEditing:(UITextView *)textView {
    
    NSLog(@"text editing done");
    
    // save the user's text in the currentJournal obj
    currentJournal.journalText = [textView text];
    
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
    
    
    // uitextview stuff to make it so it has a nice rounded border
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
