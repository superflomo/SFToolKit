//
//  NSDate+SFDateAdditions.m
//  SFToolKit
//
//  Created by Florian Bürger on 18.09.13.
//  Copyright (c) 2013 superflomo. All rights reserved.
//

#import "NSDate+SFDateAdditions.h"


@implementation NSDate (SFDateAdditions)

- (BOOL)sf_isToday
{
    NSCalendarUnit componentFlags = (NSEraCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit);
    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
    NSDateComponents *otherDateComponents = [currentCalendar components:componentFlags fromDate:self];
    NSDateComponents *todayComponents = [currentCalendar components:componentFlags fromDate:[NSDate date]];

    if (([todayComponents day] == [otherDateComponents day]) &&
            ([todayComponents month] == [otherDateComponents month]) &&
            ([todayComponents year] == [otherDateComponents year]) &&
            ([todayComponents era] == [otherDateComponents era])) {
        return YES;
    }

    return NO;
}

@end
