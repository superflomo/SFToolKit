//
//  SFLogFormatter.m
//  SFToolKit
//
//  Created by Florian Bürger on 21/06/13.
//  Copyright (c) 2013 superflomo. All rights reserved.
//

#import "SFLogFormatter.h"


@interface SFLogFormatter ()
@end


@implementation SFLogFormatter {
    NSDateFormatter *_dateFormatter;
}

- (id)init
{
    self = [super init];
    if (!self) {
        return nil;
    }

    _dateFormatter = [NSDateFormatter new];
    _dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss:SSS";

    return self;
}


- (NSString *)formatLogMessage:(DDLogMessage *)logMessage
{
    NSString *logLevel;

    switch (logMessage->logFlag) {
        case LOG_FLAG_ERROR: logLevel = @"ERR \t";
            break;
        case LOG_FLAG_WARN: logLevel = @"WARN\t";
            break;
        case LOG_FLAG_INFO: logLevel = @"INFO\t";
            break;
        default: logLevel = @"    \t";
            break;
    }

    NSString *dateAndTime = [_dateFormatter stringFromDate:logMessage->timestamp];
    NSString *logMsg = logMessage->logMsg;

    NSString *logString = [NSString stringWithFormat:@"%@%@(%s) [%@ %@/%d] %@", logLevel, dateAndTime, logMessage->queueLabel, [logMessage fileName], [logMessage methodName], logMessage->lineNumber, logMsg];
    return logString;
}

@end
