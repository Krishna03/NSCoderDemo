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

- (id)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        if (name) {
            mUserName = name;
        }
        else {
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            NSString *directory = [paths objectAtIndex:0];
        
            NSString *path = [[NSString alloc] initWithFormat:@"%@/%@", directory, FILE_NAME];
        
            if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
                [self release];
            
                NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:[NSData dataWithContentsOfFile:path]];
            
                self = [[User alloc] initWithCoder:unarchiver];
            
                [unarchiver finishDecoding];
                [unarchiver release];
            }
            else {
                mUserName = @"Default User";
            }
            [path release];
        }
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    mUserName = [aDecoder decodeObjectForKey:@"Name"];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:mUserName forKey:@"Name"];
}

- (void)dealloc {
    mUserName = nil;
    
    [super dealloc];
}

@end
