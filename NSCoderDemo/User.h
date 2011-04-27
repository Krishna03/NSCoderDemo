//
//  User.h
//  NSCoderDemo
//
//  Created by Matthew King on 4/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define FILE_NAME   @"UserInfo"

@interface User : NSObject <NSCoding> {
    NSString *mUserName;
}

@property (nonatomic, retain) NSString *userName;

- (id)initWithName:(NSString *)name;

@end
