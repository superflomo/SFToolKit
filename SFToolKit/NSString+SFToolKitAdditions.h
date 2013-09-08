//
//  NSString+SFToolKitAdditions.h
//  SFToolKit
//
//  Created by Florian Bürger on 15.04.13.
//  Copyright (c) 2013 superflomo. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (SFToolKitAdditions)

- (BOOL)containsString:(NSString *)string;
- (BOOL)containsString:(NSString *)string options:(NSStringCompareOptions)options;

@end
