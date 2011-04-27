//
//  User.h
//  NSCoderDemo
//
//  Created by Matthew King on 4/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

//Use a macro to define the file name. This will ensure that you always look for the correct file.
#define FILE_NAME   @"UserInfo"

//Conform the class to NSCoding Protocol by adding <NSCoding>.
@interface User : NSObject <NSCoding> {
    NSString *mUserName;
}

//Create a property for the users name
@property (nonatomic, retain) NSString *userName;

- (id)initWithName:(NSString *)name;

@end
