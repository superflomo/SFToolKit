//
//  NSFileManager+Directories.m
//  SFToolKit
//
//  Created by Moritz Haarmann on 28.03.13.
//  Copyright (c) 2013 superflomo. All rights reserved.
//

#import "NSFileManager+Directories.h"


@implementation NSFileManager (Directories)

- (NSString *)applicationSupportDirectory
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *applicationSupportPath = [paths objectAtIndex:0];

    return applicationSupportPath;
}


- (NSString *)documentsDirectory
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    return documentsPath;
}

@end
