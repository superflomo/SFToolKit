//
//  SFUIKitMainThreadGuard.h
//  SFToolKit
//
//  Created by Florian Bürger on 31.05.13.
//  Copyright (c) 2013 superflomo. All rights reserved.
//

#import <objc/runtime.h>
#import <objc/message.h>
#import <QuartzCore/QuartzCore.h>

#ifndef SFToolKit_SFUIKitMainThreadGuard_h
#define SFToolKit_SFUIKitMainThreadGuard_h

#define PROPERTY(propName) NSStringFromSelector(@selector(propName))

// All creadit goes to Peter Steinberger
// https://gist.github.com/steipete/5664345

#ifdef DEBUG

static void SFSwizzleMethod(Class c, SEL orig, SEL new) {
    Method origMethod = class_getInstanceMethod(c, orig);
    Method newMethod = class_getInstanceMethod(c, new);
    if (class_addMethod(c, orig, method_getImplementation(newMethod), method_getTypeEncoding(newMethod))) {
        class_replaceMethod(c, new, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
    }else {
        method_exchangeImplementations(origMethod, newMethod);
    }
}

static void SFReplaceMethod(Class c, SEL orig, SEL newSel, IMP impl) {
    Method method = class_getInstanceMethod(c, orig);
    if (!class_addMethod(c, newSel, impl, method_getTypeEncoding(method))) {
        NSLog(@"Failed to add method: %@ on %@", NSStringFromSelector(newSel), c);
    }else SFSwizzleMethod(c, orig, newSel);
}

///////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - Tracks down calls to UIKit from a Thread other than Main

static void SFAssertIfNotMainThread(void) {
    SFAssert([NSThread isMainThread], @"\nERROR: All calls to UIKit need to happen on the main thread. You have a bug in your code. Use dispatch_async(dispatch_get_main_queue(), ^{ ... }); if you're unsure what thread you're in.\n\nBreak on SFAssertIfNotMainThread to find out where.\n\nStacktrace: %@", [NSThread callStackSymbols]);
}

// This installs a small guard that checks for the most common threading-errors in UIKit.
// This won't really slow down performance but still only is compiled in DEBUG versions of SFKit.
// @note No private API is used here.
__attribute__((constructor)) static void SFUIKitMainThreadGuard(void) {
    @autoreleasepool {
        for (NSString *selector in @[PROPERTY(setNeedsLayout), PROPERTY(setNeedsDisplay), PROPERTY(setNeedsDisplayInRect:)]) {
            SEL newSelector = NSSelectorFromString([NSString stringWithFormat:@"sf_%@", selector]);
            if ([selector hasSuffix:@":"]) {
                SFReplaceMethod(UIView.class, NSSelectorFromString(selector), newSelector, imp_implementationWithBlock(^(UIView *_self, CGRect r) {
                    SFAssertIfNotMainThread();
                    ((void ( *)(id, SEL, CGRect))objc_msgSend)(_self, newSelector, r);
                }));
            }else {
                SFReplaceMethod(UIView.class, NSSelectorFromString(selector), newSelector, imp_implementationWithBlock(^(UIView *_self) {
                    SFAssertIfNotMainThread();
                    ((void ( *)(id, SEL))objc_msgSend)(_self, newSelector);
                }));
            }
        }
    }
}

#endif

#endif
