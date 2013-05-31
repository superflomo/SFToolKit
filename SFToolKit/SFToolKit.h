//
//  SFToolKit.h
//  SFToolKit
//
//  Created by Florian Bürger on 28.03.13.
//  Copyright (c) 2013 superflomo. All rights reserved.
//

#import "SFMD5Utilities.h"
#import "NSFileManager+Directories.h"
#import "UIColor+RGB.h"
#import "NSString+SFToolKitAdditions.h"
#import "SFBaseViewController.h"
#import "NSArray+SFToolKitAdditions.h"
#import "SFBaseTableViewController.h"
#import "SFNavigationController.h"
#import "SFAssert.h"

// -------------------------------------
#pragma mark - Utility Functions
// -------------------------------------

// Check if an object is empty
// no matter what type it is
//
// works for objects responding to
//
// -length
// -count
//
// as well for nil / NSNUll
BOOL SFIsEmpty(id obj);
// Faster function for strings
//
// Checks agains
// -length
// NSNull
// nil
BOOL SFIsEmptyString(NSString *s);

// -------------------------------------
#pragma mark - Macros & Preprocessor
// -------------------------------------

// Simple conditional logging
// when cocoa-lumberjack seems like overkill
//
// use DLog() for debug only logs
// use RLog() for release only logs
// use ALog() for logging everytime (like NSLog())
//
#ifdef DEBUG
#define DLog(fmt, ...) NSLog(@"%@:%d (%s): " fmt, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, __func__, ## __VA_ARGS__)
#define RLog(...) do { } while (0)
#define ALog(...) [[NSAssertionHandler currentHandler]                       \
handleFailureInFunction:[NSString stringWithCString:__PRETTY_FUNCTION__    \
encoding:NSUTF8StringEncoding] file:[NSString stringWithCString:__FILE__   \
encoding:NSUTF8StringEncoding] lineNumber:__LINE__ description:__VA_ARGS__]
#else
#define DLog(...) do { } while (0)
#define RLog(fmt, ...) NSLog(@"%@:%d (%s): " fmt, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, __func__, ## __VA_ARGS__)
#define ALog(...) NSLog(__VA_ARGS__)
#endif
