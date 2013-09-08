//
//  SFMD5Utilities.m
//  SFToolKit
//
//  Created by Florian Bürger on 28.03.13.
//  Copyright (c) 2013 superflomo. All rights reserved.
//

#import "SFMD5Utilities.h"
#import <CommonCrypto/CommonDigest.h>


@implementation NSString (SFMD5)

+ (NSString *)sf_md5HashFromString:(NSString *)string
{
    NSParameterAssert(string);
    const char *cStringRep = [string UTF8String];
    unsigned char md5Hash[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStringRep, (CC_LONG) strlen(cStringRep), md5Hash);

    NSString *md5HashString = [NSString stringWithFormat:
                                                @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
                                                md5Hash[0], md5Hash[1], md5Hash[2], md5Hash[3], md5Hash[4],
                                                md5Hash[5], md5Hash[6], md5Hash[7], md5Hash[8], md5Hash[9],
                                                md5Hash[10], md5Hash[11], md5Hash[12], md5Hash[13], md5Hash[14],
                                                md5Hash[15]];

    return [md5HashString lowercaseString];
}

@end


@implementation NSData (SFMD5Utilities)

- (NSString *)sf_md5StringFromData;
{
    NSString *str = [[NSString alloc] initWithData:self encoding:NSUTF8StringEncoding];
    const char *cStringRep = [str UTF8String];
    unsigned char md5Hash[CC_MD5_DIGEST_LENGTH];

    CC_MD5(cStringRep, (CC_LONG) strlen(cStringRep), md5Hash);

    NSString *md5HashString = [NSString stringWithFormat:
                                                @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
                                                md5Hash[0], md5Hash[1], md5Hash[2], md5Hash[3], md5Hash[4],
                                                md5Hash[5], md5Hash[6], md5Hash[7], md5Hash[8], md5Hash[9],
                                                md5Hash[10], md5Hash[11], md5Hash[12], md5Hash[13], md5Hash[14],
                                                md5Hash[15]];

    return [md5HashString lowercaseString];
}

@end
