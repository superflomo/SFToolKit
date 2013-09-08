//
//  SFMD5Utilities.h
//  SFToolKit
//
//  Created by Florian Bürger on 28.03.13.
//  Copyright (c) 2013 superflomo. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (SFMD5Utilities)

/**
 *   Return the MD5 value of the string passed in
 */
+ (NSString *)sf_md5HashFromString:(NSString *)aString;

@end


@interface NSData (SFMD5Utilities)

/**
 *   Convience method to return the MD5 value of the contents of an object given
 */
- (NSString *)sf_md5StringFromData;

@end
