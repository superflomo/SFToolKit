//
//  NSDateAdditionTests.m
//  SFToolKit
//
//  Created by Florian Bürger on 18.09.13.
//  Copyright (c) 2013 superflomo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSDate+SFDateAdditions.h"


@interface NSDateAdditionTests : XCTestCase

@end

@implementation NSDateAdditionTests


- (void)testTodayCheck
{
    NSDate *now = [NSDate date];
    NSDate *distantFuture = [NSDate distantFuture];
    XCTAssertFalse([distantFuture sf_isToday]);
}

@end
