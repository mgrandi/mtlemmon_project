//
//  JournalCreateViewController.h
//  mtlemmon_project
//
//  Created by Benjamin Dicken, Mark Grandi, Charles Rickards and Stefan Lindstrom on 11/27/11.
//  Copyright (c) 2011 Flandrau Science Center, UofA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Journal.h"

@interface JournalCreateViewController : UIViewController <NSURLConnectionDataDelegate, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, CLLocationManagerDelegate> {
    
    
    IBOutlet UIButton *okButton;
    IBOutlet UITextView *theTextView;
    IBOutlet UILabel *locationLabel;
    IBOutlet UILabel *dateLabel;
    IBOutlet UIImageView *theImageView;
    IBOutlet UIImageView *locationStatusView;
    
    Journal *currentJournal;
    UIImagePickerController *imagePicker;
    CLLocationManager *locationManager;
    
}

-(void)sendJsonDataToServer:(NSData *)jsonData;

@end
