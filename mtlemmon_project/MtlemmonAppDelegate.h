//
//  AppDelegate.h
//  mtlemmon_project
//
//  Created by Mark Grandi on 11/5/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 MtlemmonAppDelegate.h
 header file for MtlemmonAppDelegate.m
 
 
 
 */
@interface MtlemmonAppDelegate : UIResponder <UIApplicationDelegate> {
    
    UINavigationController *navController;
    
}

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, retain) UINavigationController *navController;

@end
