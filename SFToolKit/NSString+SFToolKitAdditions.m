//
//  NSString+SFToolKitAdditions.m
//  SFToolKit
//
//  Created by Florian Bürger on 15.04.13.
//  Copyright (c) 2013 superflomo. All rights reserved.
//

#import "NSString+SFToolKitAdditions.h"

@implementation NSString (SFToolKitAdditions)

- (BOOL)containsString:(NSString *)string;
{
    return [self containsString:string options:0];
}

- (BOOL)containsString:(NSString *)string options:(NSStringCompareOptions)options;
{
    BOOL contains = NO;
    if ([self rangeOfString:string options:options].location != NSNotFound) {
        contains = YES;
    }
    return contains;
}

@end
