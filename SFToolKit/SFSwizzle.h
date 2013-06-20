//
//  SFSwizzle.h
//  SFToolKit
//
//  Created by Florian Bürger on 20/06/13.
//  Copyright (c) 2013 superflomo. All rights reserved.
//

void SFSwizzleMethod(Class c, SEL orig, SEL new);
void SFReplaceMethod(Class c, SEL orig, SEL newSel, IMP impl);
