//
//  SFAssert.h
//  SFToolKit
//
//  Created by Florian Bürger on 31.05.13.
//  Copyright (c) 2013 superflomo. All rights reserved.
//

#ifndef SFToolKit_SFEmptiness_h
#define SFToolKit_SFEmptiness_h

// Check if an object is empty
// no matter what type it is
//
// works for objects responding to
//
// -length
// -count
//
// as well for nil / NSNUll
BOOL SFIsEmpty(id obj);
// Faster function for strings
//
// Checks agains
// -length
// NSNull
// nil
BOOL SFIsEmptyString(NSString *s);

#endif
