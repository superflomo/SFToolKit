//
//  SFStringAdditionsTests.m
//  SFToolKit
//
//  Created by Florian Bürger on 15.04.13.
//  Copyright (c) 2013 superflomo. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "NSString+SFToolKitAdditions.h"

@interface SFStringAdditionsTests : SenTestCase {
    NSString *_testString;
    NSString *_stringToTestAgainst;
}
@end

@implementation SFStringAdditionsTests

- (void)setUp
{
    _stringToTestAgainst = @"hello World!";
}

- (void)testContainsShouldReturnNoWhenStringIsNotMatched
{
    NSString *testString = @"Hello";
	STAssertFalse([_stringToTestAgainst containsString:testString], nil);
}

- (void)testContainsShouldReturnYesWhenStringIsMatched
{
    NSString *testString = @"Hello";
    STAssertTrue([_stringToTestAgainst containsString:testString options:NSCaseInsensitiveSearch], nil);
}

- (void)testContainsShouldReturnYesWhenStringIsMatchedWithoutOptions
{
    NSString *testString = @"hello";
    STAssertTrue([_stringToTestAgainst containsString:testString], nil);
}

@end
