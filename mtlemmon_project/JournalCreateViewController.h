//
//  JournalCreateViewController.h
//  mtlemmon_project
//
//  Created by Mark Grandi on 12/3/11.
//  Copyright (c) 2011 Flandrau Science Center, UofA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Journal.h"

@interface JournalCreateViewController : UIViewController <NSURLConnectionDataDelegate, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate> {
    
    
    IBOutlet UIButton *okButton;
    IBOutlet UITextView *theTextView;
    
    UIImagePickerController *imagePicker;
    
    IBOutlet UIImageView *theImageView;


    Journal *currentJournal;
    
}

@end
