//
//  SFDeviceInformation.m
//  SFToolKit
//
//  Created by Florian Bürger on 25/06/13.
//  Copyright (c) 2013 superflomo. All rights reserved.
//

#import "UIDevice+SFDeviceInformation.h"
#import <CocoaLumberjack/DDLog.h>

@implementation UIDevice (SFDeviceInformation)

+ (BOOL)sf_isSystemVersionGreaterThanOrEqual:(NSString *)versionStringToCheckAgainst
{
    NSString *currSysVer = [[self currentDevice] systemVersion];
    NSLog(@"Checking iOS Version. Current version is %@", currSysVer);
    if ([currSysVer compare:versionStringToCheckAgainst options:NSNumericSearch] != NSOrderedAscending) {
        NSLog(@"Version to check against (%@) is higher or eqal.", versionStringToCheckAgainst);
        return YES;
    } else {
        NSLog(@"Version to check against (%@) is lower.", versionStringToCheckAgainst);
        return NO;
    }
}

@end
