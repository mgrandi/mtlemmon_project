//
//  AppDelegate.h
//  mtlemmon_project
//
//  Created by Benjamin Dicken, Mark Grandi, Charles Rickards and Stefan Lindstrom on 11/27/11.
//  Copyright (c) 2011 Flandrau Science Center, UofA. All rights reserved.

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
