//
//  SFTTYLogFormatter.h
//  SFToolKit
//
//  Created by Florian Bürger on 01.04.13.
//  Copyright (c) 2013 superflomo. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifdef LOG_VERBOSE
@interface SFTTYLogFormatter : NSObject <DDLogFormatter>
#else
@interface SFTTYLogFormatter : NSObject
#endif
@end
