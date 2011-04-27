//
//  RootViewController.h
//  NSCoderDemo
//
//  Created by Matthew King on 4/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RootViewController : UIViewController <UITextFieldDelegate> {
    IBOutlet UITextField *nameField;
}

- (IBAction)saveName:(id)sender;

@end
