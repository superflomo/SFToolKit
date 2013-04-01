//
//  SFTTYLogFormatter.m
//  SFToolKit
//
//  Created by Florian Bürger on 01.04.13.
//  Copyright (c) 2013 superflomo. All rights reserved.
//

#import "SFTTYLogFormatter.h"

#ifdef LOG_VERBOSE
// This class is supposed to be used along with cocoa-lumberjack via cocoapods
#import <CococaLumberjack/DDLog.h>

@interface SFTTYLogFormatter ()
@property NSDateFormatter *dateFormatter;
@end

#endif

@implementation SFTTYLogFormatter

#ifdef LOG_VERBOSE

- (id)init
{
    self = [super init];
    
    if (self) {
        self.dateFormatter = [[NSDateFormatter alloc] init];
        self.dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss:SSS";
    }
    
    return self;
}

- (NSString *)formatLogMessage:(DDLogMessage *)logMessage
{
    NSString *logLevel;
    
    switch (logMessage->logFlag) {
        case LOG_FLAG_ERROR:
            logLevel = @"ERROR\t"; break;
            
        case LOG_FLAG_WARN:
            logLevel = @"WARNING\t"; break;
            
        case LOG_FLAG_INFO:
            logLevel = @"INFO\t"; break;
            
        default:
            logLevel = @""; break;
    }
    
    NSString *dateAndTime = [_dateFormatter stringFromDate:logMessage->timestamp];
    NSString *logMsg = logMessage->logMsg;
    
    NSString *logString = [NSString stringWithFormat:@"%@%@(%s) [%@ %@/%d] %@", logLevel, dateAndTime, logMessage->queueLabel, [logMessage fileName], [logMessage methodName], logMessage->lineNumber, logMsg];
    return logString;
}

#endif	/* ifdef LOG_VERBOSE */

@end
