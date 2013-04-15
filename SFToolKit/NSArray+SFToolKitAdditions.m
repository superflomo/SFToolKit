//
//  NSArray+SFToolKitAdditions.m
//  SFToolKit
//
//  Created by Florian Bürger on 15.04.13.
//  Copyright (c) 2013 superflomo. All rights reserved.
//

#import "NSArray+SFToolKitAdditions.h"

@implementation NSArray (SFToolKitAdditions)

- (id)firstObject;
{
	if ([self count] > 0) {
		return self[0];
	} else {
		return nil;
	}
}

@end
