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

@end
