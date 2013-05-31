//
//  SFAssert.h
//  SFToolKit
//
//  Created by Florian Bürger on 31.05.13.
//  Copyright (c) 2013 superflomo. All rights reserved.
//

#ifndef SFToolKit_SFAssert_h
#define SFToolKit_SFAssert_h

// A better assert. NSAssert is too runtime dependant, and assert() doesn't log.
// http://www.mikeash.com/pyblog/friday-qa-2013-05-03-proper-use-of-asserts.html
// Accepts both:
// - SFAssert(x > 0);
// - SFAssert(y > 3, @"Bad value for y");
// Taken from Peter Steinberger
// https://gist.github.com/steipete/5664345
#define SFAssert(expression, ...) \
do { if(!(expression)) { \
NSLog(@"%@", [NSString stringWithFormat: @"Assertion failure: %s in %s on line %s:%d. %@", #expression, __PRETTY_FUNCTION__, __FILE__, __LINE__, [NSString stringWithFormat:@"" __VA_ARGS__]]); \
abort(); }} while(0)

#endif
