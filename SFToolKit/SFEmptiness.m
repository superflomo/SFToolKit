//
//  SFAssert.h
//  SFToolKit
//
//  Created by Florian Bürger on 31.05.13.
//  Copyright (c) 2013 superflomo. All rights reserved.
//

// thanks to Brent Simmons: http://inessential.com/2012/07/28/emptiness

#import "SFEmptiness.h"

BOOL SFIsEmpty(id obj)
{
	return obj == nil || obj == [NSNull null] || ([obj respondsToSelector:@selector(length)] && [(NSData *)obj length] == 0) || ([obj respondsToSelector:@selector(count)] && [obj count] == 0);
}

BOOL SFIsEmptyString(NSString *s)
{
	return s == nil || (id)s == (id)[NSNull null] || [s length] == 0;
}

