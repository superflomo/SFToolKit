//
//  UIButton+IncreasedTouchArea.m
//  SFToolKit
//
//  Created by Florian Bürger on 20/06/13.
//  Copyright (c) 2013 superflomo. All rights reserved.
//

#import "UIButton+IncreasedTouchArea.h"
#import "SFSwizzle.h"
#import <objc/runtime.h>


static char kSFIncreadesTouchAreaKey;


@implementation UIButton (IncreasedTouchArea)

@dynamic sf_hitTestEdgeInsets;

#pragma mark - Swizzling

__attribute__((constructor)) static void SFAddSupportIncreasedTouchArea(void) {
    @autoreleasepool {
        SFSwizzleMethod(UIButton.class, @selector(hitTest:withEvent:), @selector(sf_hitTest:withEvent:));
    }
}


- (UIView *)sf_hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    if (UIEdgeInsetsEqualToEdgeInsets(self.sf_hitTestEdgeInsets, UIEdgeInsetsZero) || !self.enabled || self.hidden) {
        return [self sf_hitTest:point withEvent:event];
    }

    CGRect relativeFrame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    CGRect hitFrame = UIEdgeInsetsInsetRect(relativeFrame, self.sf_hitTestEdgeInsets);

    if (CGRectContainsPoint(hitFrame, point)) {
        return self;
    }

    return nil;
}

#pragma mark - Accessors

- (UIEdgeInsets)sf_hitTestEdgeInsets
{
    NSValue *boxedEdgeInsets = objc_getAssociatedObject(self, &kSFIncreadesTouchAreaKey);
    return boxedEdgeInsets.UIEdgeInsetsValue;
}


- (void)setSf_hitTestEdgeInsets:(UIEdgeInsets)sf_hitTestEdgeInsets
{
    NSValue *boxedEdgeInsets = [NSValue valueWithUIEdgeInsets:sf_hitTestEdgeInsets];
    objc_setAssociatedObject(self, &kSFIncreadesTouchAreaKey, boxedEdgeInsets, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
