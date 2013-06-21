//
//  SFBaseAppDelegate.m
//  SFToolKit
//
//  Created by Florian Bürger on 21/06/13.
//  Copyright (c) 2013 superflomo. All rights reserved.
//

#import "SFBaseAppDelegate.h"
#import "SFLogFormatter.h"

#import <CocoaLumberjack/DDTTYLogger.h>
#import <CocoaLumberjack/DDASLLogger.h>

#ifdef DEBUG
int ddLogLevel = LOG_LEVEL_VERBOSE;
#else
int ddLogLevel = LOG_LEVEL_WARN;
#endif

@interface SFBaseAppDelegate ()
- (void)configureCocoaLumberjack;
@end

@implementation SFBaseAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self configureCocoaLumberjack];
	return YES;
}

- (void)configureCocoaLumberjack {
	SFLogFormatter *formatter = [[SFLogFormatter alloc] init];
#ifdef DEBUG
	DDTTYLogger *ttyLogger = [DDTTYLogger sharedInstance];
	ttyLogger.logFormatter = formatter;
	[DDLog addLogger:ttyLogger];
#endif
	DDASLLogger *aslLogger = [DDASLLogger sharedInstance];
	aslLogger.logFormatter = formatter;
	[DDLog addLogger:aslLogger];
}

@end
