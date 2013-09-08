//
//  SFSwizzle.h
//  SFToolKit
//
//  Created by Florian Bürger on 20/06/13.
//  Copyright (c) 2013 superflomo. All rights reserved.
//

#import "SFSwizzle.h"
#import <objc/runtime.h>

// http://www.mikeash.com/pyblog/friday-qa-2010-01-29-method-replacement-for-fun-and-profit.html

void SFSwizzleMethod(Class c, SEL orig, SEL new) {
    Method origMethod = class_getInstanceMethod(c, orig);
    Method newMethod = class_getInstanceMethod(c, new);
    if (class_addMethod(c, orig, method_getImplementation(newMethod), method_getTypeEncoding(newMethod))) {
        class_replaceMethod(c, new, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
    } else {
        method_exchangeImplementations(origMethod, newMethod);
    }
}


void SFReplaceMethod(Class c, SEL orig, SEL newSel, IMP impl) {
    Method method = class_getInstanceMethod(c, orig);
    if (!class_addMethod(c, newSel, impl, method_getTypeEncoding(method))) {
    } else {SFSwizzleMethod(c, orig, newSel);}
}
