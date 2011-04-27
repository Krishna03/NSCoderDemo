//
//  NSCoderDemoAppDelegate.h
//  NSCoderDemo
//
//  Created by Matthew King on 4/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"

@interface NSCoderDemoAppDelegate : NSObject <UIApplicationDelegate> {
    IBOutlet RootViewController *rootViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end
