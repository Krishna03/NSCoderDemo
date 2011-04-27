//
//  RootViewController.m
//  NSCoderDemo
//
//  Created by Matthew King on 4/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import "User.h"

@implementation RootViewController
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    
    User *user = [[User alloc] initWithName:nil];
       
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hello" message:user.userName delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    [alert release];
    
    [user release];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)saveName:(id)sender {
    if ([nameField.text length] > 0) {
        NSMutableData *data = [NSMutableData data];
        User *user = [[User alloc] initWithName:nameField.text];
        
        NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
        [user encodeWithCoder:archiver];
        [archiver finishEncoding];
        
        [user release];
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *directory = [paths objectAtIndex:0];
        
        NSString *path = [[NSString alloc] initWithFormat:@"%@/%@", directory, FILE_NAME];
        [data writeToFile:path atomically:YES];
        
        [archiver release];
        [path release];
        
        [nameField resignFirstResponder];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Name Saved" message:nameField.text delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
}

#pragma mark - Delegates

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    return YES;
}

- (void)dealloc {
    [super dealloc];
}

@end
