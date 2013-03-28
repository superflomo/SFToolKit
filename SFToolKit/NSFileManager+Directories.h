//
//  NSFileManager+Directories.h
//  SFToolKit
//
//  Created by Moritz Haarmann on 28.03.13.
//  Copyright (c) 2013 superflomo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (Directories)

/**
 * Returns the path to the application support directory.
 */
-(NSString*)applicationSupportDirectory;

/**
 * Returns the path to the local documents directory.
 */
-(NSString*)documentsDirectory;

@end
