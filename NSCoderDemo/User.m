//
//  User.m
//  NSCoderDemo
//
//  Created by Matthew King on 4/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "User.h"


@implementation User

@synthesize userName=mUserName;

#pragma mark - Default Initalizer

- (id)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        //If name is not nil, then set it to the mUserName instance variable so it can be saved. Then return.
        if (name) {
            mUserName = name;
        }
        //If name is nil look for a saved instance of the User object and return it or set the mUserName variable to "Default User". 
        else {
            //Find the path to the file that contains the data of a saved User object.
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            NSString *directory = [paths objectAtIndex:0];
        
            NSString *path = [[NSString alloc] initWithFormat:@"%@/%@", directory, FILE_NAME];
            
            //Check and see if the file exists
            if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
                //If the file exist call [self release] to release the current instance of the User object and replace it with the
                //the one that is saved on the device.
                [self release];
            
                NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:[NSData dataWithContentsOfFile:path]];
            
                self = [[User alloc] initWithCoder:unarchiver];
            
                [unarchiver finishDecoding];
                [unarchiver release];
            }
            else {
                //If the file does not exist set the mUserName instance variable to "Default User".
                mUserName = @"Default User";
            }
            [path release];
        }
    }
    return self;
}

#pragma mark - Encoding and Decoding

//initWithCoder: and encodeWithCoder: are required methods of the NSCoding Protocol.

- (id)initWithCoder:(NSCoder *)aDecoder {
    //Decode the mUserName variable that was from the saved data.
    mUserName = [aDecoder decodeObjectForKey:@"Name"];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    //Encode the mUserName variable so it can be saved to a data file.
    [aCoder encodeObject:mUserName forKey:@"Name"];
}

#pragma mark - Memory Management

- (void)dealloc {
    mUserName = nil;
    
    [super dealloc];
}

@end
