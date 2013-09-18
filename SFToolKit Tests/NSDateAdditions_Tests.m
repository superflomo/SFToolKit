//
//  NSDateAdditions_Tests.m
//  SFToolKit
//
//  Created by Florian Bürger on 18.09.13.
//  Copyright (c) 2013 superflomo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSDate+SFDateAdditions.h"


@interface NSDateAdditions_Tests : XCTestCase

@end

@implementation NSDateAdditions_Tests


- (void)testNowIsToday
{
    NSDate *now = [NSDate date];
    XCTAssertTrue([now sf_isToday]);
}


- (void)testTomorrowIsNotToday
{
    NSDate *now = [NSDate date];
 
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit componentFlags = (NSEraCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit);
    NSDateComponents *components = [calendar components:componentFlags fromDate:now];
    components.day += 1;
    NSDate *tomorrow = [calendar dateFromComponents:components];
    
    XCTAssertFalse([tomorrow sf_isToday]);
}

- (void)testNowPlusOneHourIsToday
{
    NSDate *now = [NSDate date];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit componentFlags = (NSEraCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit);
    NSDateComponents *components = [calendar components:componentFlags fromDate:now];
    components.hour += 1;
    NSDate *tomorrow = [calendar dateFromComponents:components];
    
    XCTAssertTrue([tomorrow sf_isToday]);
}


@end
