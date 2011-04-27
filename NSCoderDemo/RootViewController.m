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

#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Intalize a user instance with the no name identified.
    User *user = [[User alloc] initWithName:nil];
       
    //Say Hello to the User.
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

#pragma mark - Actions

- (IBAction)saveName:(id)sender {
    //Make sure the user has entered a name before saving
    if ([nameField.text length] > 0) {
        //Create a NSMutableData instance to write the object to. Then create an User instance with the provide name
        
        NSMutableData *data = [NSMutableData data];
        User *user = [[User alloc] initWithName:nameField.text];
        
        //Create a NSKeyedArchiver instance to write that will write the User insance to the data instance.
        //Call encodeWithCoder: on the user instance
        //Call finishEncoding on the archiver instance. The archiver instance will not write the data until finishEncoding is called.
        NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
        [user encodeWithCoder:archiver];
        [archiver finishEncoding];
        
        [user release];
        
        //Find the local documents directory
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *directory = [paths objectAtIndex:0];
        
        //Create a path to file in the documents directory where you want the data to be saved
        //Write the data to the file using writeToFile:atomically:
        NSString *path = [[NSString alloc] initWithFormat:@"%@/%@", directory, FILE_NAME];
        [data writeToFile:path atomically:YES];
        
        //Release all the objects that you own, dismiss the Keyboard and tell the user that name has been saved.
        [archiver release];
        [path release];
        
        [nameField resignFirstResponder];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Name Saved" message:nameField.text delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
}

#pragma mark - Memory Management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)dealloc {
    [super dealloc];
}

@end
