//
//  UIColor+RGB.m
//  SFToolkit
//
//  Created by Moritz Haarmann on 08.08.12.
//  Copyright (c) 2012 Moritz Haarmann. All rights reserved.
//

#import "UIColor+RGB.h"

@implementation UIColor (RGB)

+ (UIColor *)colorWithHexString:(NSString *)hexString
{
    return [self colorWithHexString:hexString andAlpha:1.0f];
}


+ (UIColor *)colorWithHexValue:(uint)hexValue
{
    return [self colorWithHexValue:hexValue andAlpha:1.0f];
}


+ (UIColor *)colorWithHexValue:(uint)hexValue andAlpha:(float)alpha {
    return [UIColor
            colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
            green:((float)((hexValue & 0xFF00) >> 8))/255.0
            blue:((float)(hexValue & 0xFF))/255.0
            alpha:alpha];
}

+(UIColor*)colorWithHexString:(NSString*)hexString andAlpha:(float)alpha {
    UIColor *col;
    hexString = [hexString stringByReplacingOccurrencesOfString:@"#"
                                                     withString:@"0x"];
    uint hexValue;
    if ([[NSScanner scannerWithString:hexString] scanHexInt:&hexValue]) {
        col = [self colorWithHexValue:hexValue andAlpha:alpha];
    } else {
        // invalid hex string
        col = [self blackColor];
    }
    return col;
}

@end
