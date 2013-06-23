//
//  SFBaseViewController.m
//  SFToolKit
//
//  Created by Florian Bürger on 15.04.13.
//  Copyright (c) 2013 superflomo. All rights reserved.
//

#import "SFBaseViewController.h"
#import "NSString+SFToolKitAdditions.h"
#import "SFEmptiness.h"

@interface SFBaseViewController ()
+ (BOOL)isXibWithName:(NSString *)xibName inBundle:(NSBundle *)bundle;
@end

@implementation SFBaseViewController

- (void)commonSFBaseViewControllerInit
{
	// Override in subclasses to customize initialization...
}

+ (NSString *)defaultNibName
{
	NSString *nibName;
	NSString *className = NSStringFromClass(self);

	nibName = [className stringByReplacingOccurrencesOfString:@"Controller" withString:@""];

    if ([self isXibWithName:nibName inBundle:[NSBundle mainBundle]]) {
        return nibName;
    }

    NSString *deviceSuffix;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        deviceSuffix = @"_iPhone";
    } else {
        deviceSuffix = @"_iPad";
    }

    nibName = [nibName stringByAppendingString:deviceSuffix];

    return nibName;
}

- (NSString *)defaultNibName
{
	return [[self class] defaultNibName];
}

#pragma mark - Initializer

- (id)init
{
	return [self initWithNibName:[self defaultNibName] bundle:nil];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
	if (!self) {
        return nil;
	}

    [self commonSFBaseViewControllerInit];

	return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (!self) {
        return nil;
	}
    
    [self commonSFBaseViewControllerInit];

	return self;
}

#pragma mark - Private

+ (BOOL)isXibWithName:(NSString *)xibName inBundle:(NSBundle *)bundle;
{
	if ([bundle pathForResource:xibName ofType:@"nib"] == nil) {
		return NO;
	}

	return YES;
}

@end
