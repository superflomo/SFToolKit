//
//  UIColor+RGB.h
//  SFToolkit
//
//  Created by Moritz Haarmann on 08.08.12.
//  Copyright (c) 2012 Moritz Haarmann. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIColor (RGB)

// alpha 1.0f
+ (UIColor *)colorWithHexString:(NSString *)hexString;
+ (UIColor *)colorWithHexValue:(uint)hexValue;

+ (UIColor *)colorWithHexValue:(uint)hexValue andAlpha:(float)alpha;
+ (UIColor *)colorWithHexString:(NSString *)hexString andAlpha:(float)alpha;

@end
