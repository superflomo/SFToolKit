//
//  SFDeviceInformation.h
//  SFToolKit
//
//  Created by Florian Bürger on 25/06/13.
//  Copyright (c) 2013 superflomo. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIDevice (SFDeviceInformation)

/** 
 Check current running system against given version string
 @param versionString The systemVersion string to check against (e.g. '6.0')

 usage (running on iOS 7.0):

    BOOL isiOS7 = [UIDevice sf_isSystemVersionGreaterThanOrEqual(@"7.0")];
    NSLog(@"Running on iOS >= 7.0? %@", (isiOS7 == YES) ? @"YES" : @"NO");
 
*/
+ (BOOL)sf_isSystemVersionGreaterThanOrEqual:(NSString *)versionString;

@end
