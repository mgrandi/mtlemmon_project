//
//  JournalCreateViewController.m
//  mtlemmon_project
//
//  Created by Benjamin Dicken, Mark Grandi, Charles Rickards and Stefan Lindstrom on 11/27/11.
//  Copyright (c) 2011 Flandrau Science Center, UofA. All rights reserved.
//

#import "JournalCreateViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "JSONKit.h"
#import "JsonUnsupportedClasses.h"


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
        
        // create the current journal object
        currentJournal = [[Journal alloc] init];
        
        
        // add the "take photo" button to the navigation bar
        UIBarButtonItem *cameraButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemCamera target:self action:@selector(cameraButtonClicked:)];
        
        [[self navigationItem] setRightBarButtonItem:cameraButton];
        [cameraButton release];
        
        // create the location manager and set its delegate
        locationManager = [[CLLocationManager alloc] init];
        [locationManager setDelegate:self];
        
    }
    return self;
}

-(void) dealloc {
    
    // don't need to release imagePicker because it gets created and released 
    // on its own by using the delegate methods we implemented here.
    
    [locationManager release];
    [currentJournal release];
    [super dealloc];
    
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

// gets called when the OK button gets clicked.
-(IBAction)okButtonPressed:(id)sender {
    
    
    // get the journal text
    [currentJournal setJournalText:[theTextView text]];
    
    
    // TEMPORARY FOR NOW, until i make a static class that holds all of the Journal objects
    // just put this one into an array and send it to the server
    NSArray *journalArray = [NSArray arrayWithObject:currentJournal];
    
    // the error we are passing into the method call below
    NSError *error = nil;
    
    NSData *jsonData = [journalArray JSONDataWithOptions:JKParseOptionNone serializeUnsupportedClassesUsingDelegate:[JsonUnsupportedClasses class] selector:@selector(serializeUnsupported:) error:&error];
    
    [self sendJsonDataToServer:jsonData];
    
    
}


// takes a NSData Json object and sends it to the server
-(void)sendJsonDataToServer:(NSData *)jsonData {
    
    // create the mutable url request
    NSURL *url = [NSURL URLWithString:@"http://www.kramidnarg.com/php_stuff/ios/ista392_process_journal.php"];
    NSMutableURLRequest *req = [[NSMutableURLRequest alloc] initWithURL:url];
    
    // set the data and http method
    [req setHTTPBody:jsonData];    
    [req setHTTPMethod:@"POST"];
    
    NSLog(@"connection request url is: %@", [req URL]);
    
    // create the connection and start it
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:req delegate:self];
    NSLog(@"Starting Connection!");
    [connection start];
    
}

// delegate method, gets called when the connetion did recieve a response
// from the docs:
// Sent when the connection has received sufficient data to construct the URL response for its request.
// essentially this means it has enough information to actually send the request to the server.
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    
    NSLog(@"connection did recieve response: %@", ((NSHTTPURLResponse *)response).allHeaderFields);

    
}

// delegate method: gets called when we actually get data. this is called as we get data incrementally!!!!
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    
    
    // TODO FIXME OH GOD: i'm not appending data, so if we get more didReceiveData, then this won't work! Fix it!
    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"didRecieveData: %@", result);
    
    [result release];
    
}

// delegate method: gets called when teh connection finishes loading
// this is the last thing that gets called.
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
    NSLog(@"did finish loading");
    
    [connection release];
}


// delegate method. gets called if there was an error.
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"Connection failed with error: %@", error);
    
    [connection release];
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

// method to implement for location services
// gets called when the location manager gets an update.
- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation {
    
    
    // we got a location: make sure its not cached...
    NSTimeInterval timeInterval = [[newLocation timestamp] timeIntervalSinceNow];
    
    if ( timeInterval < -180.0 ) {
        // This is cached data, you do not want it, keep looking
        NSLog(@"time interval is invalid");
        return;
    }
    
    // else: we got a valid location. stop updating and save it in the journal
    
    NSLog(@"location services got a location! %@", newLocation);
    
    [currentJournal setGpsCoord:newLocation];
    
    [manager stopUpdatingLocation];
    
    // set the location status image to be the green checkmark
    [locationStatusView setImage:[UIImage imageNamed:@"tick.png"]];
    
}


// method to implement for location services
// gets called when the location manager gets an update
- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error {
    
    // check to see if this is a kCLErrorLocationUnknown error, 
    // which just means it could not get a location instantly, and to keep trying again
    if ([error code] == kCLErrorLocationUnknown) {
       
        NSLog(@"Location services unable to report location right away!");
        return;
        
    } 
        

    // any other error means we should stop the location manager.
        
    NSLog(@"Location manager got error: %@, stopping", error);
    
    [manager stopUpdatingLocation];
    
    // set the location status image to be the red cross
    [locationStatusView setImage:[UIImage imageNamed:@"cross.png"]];
        
}

// method to implement for location services
// gets called when the location manager's authorization status changes.
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    
    // we might not need this, but if the new status is Denied, then we need to stop the location manager
    
    if (status == kCLAuthorizationStatusDenied || status == kCLAuthorizationStatusRestricted) {
        
        
        NSLog(@"Location service authorization status is now denied or restricted! Stopping");
        
        [manager stopUpdatingLocation];
        
        // set the location status image to be the red cross
        [locationStatusView setImage:[UIImage imageNamed:@"cross.png"]];
        
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
    
    // set the date label
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    [dateLabel setText:[NSString stringWithFormat:@"Date: %@", [formatter stringFromDate:[currentJournal date]]]]; 
    [formatter release];
    
    
    // set the Location's status image to be waiting
    [locationStatusView setImage:[UIImage imageNamed:@"time.png"]];
    
    // start trying to get a location
    [locationManager startUpdatingLocation];
    
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
