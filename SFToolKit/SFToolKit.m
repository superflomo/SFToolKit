//
//  SFToolKit.m
//  SFToolKit
//
//  Created by Florian Bürger on 28.03.13.
//  Copyright (c) 2013 superflomo. All rights reserved.
//

#import "SFToolKit.h"

BOOL SFIsEmpty(id obj)
{
	return obj == nil || obj == [NSNull null] || ([obj respondsToSelector:@selector(length)] && [(NSData *)obj length] == 0) || ([obj respondsToSelector:@selector(count)] && [obj count] == 0);
}

BOOL SFStringIsEmpty(NSString *s)
{
	return s == nil || (id)s == (id)[NSNull null] || [s length] == 0;
}
