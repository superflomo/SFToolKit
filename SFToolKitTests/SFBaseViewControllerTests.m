//
//  SFBaseViewControllerTests.m
//  SFToolKit
//
//  Created by Florian Bürger on 15.04.13.
//  Copyright (c) 2013 superflomo. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "SFBaseViewController.h"
#import <OCMock/OCMock.h>

@interface SFBaseViewControllerTests : SenTestCase
@end

@implementation SFBaseViewControllerTests

- (void)testItShouldRaiseIfXibDoesntExists
{
	STAssertThrows([SFBaseViewController defaultNibName], nil);
}

- (void)testItShouldReturnNibNameWithoutControllerWhenXibExists
{
	id mockBundle = [OCMockObject mockForClass:[NSBundle class]];
    
	[[[mockBundle stub] andReturn:@"path"] pathForResource:[OCMArg any] ofType:[OCMArg any]];
	NSString *expected = @"SFBaseView";
	NSString *result = [SFBaseViewController defaultNibNameInBundle:mockBundle];
    
	STAssertEqualObjects(expected, result, nil);
}

@end
