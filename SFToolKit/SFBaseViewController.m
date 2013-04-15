//
//  SFBaseViewController.m
//  SFToolKit
//
//  Created by Florian Bürger on 15.04.13.
//  Copyright (c) 2013 superflomo. All rights reserved.
//

#import "SFBaseViewController.h"
#import "NSString+SFToolKitAdditions.h"

@interface SFBaseViewController ()
+ (BOOL)_isXibWithName:(NSString *)xibName inBundle:(NSBundle *)bundle;
@end

@implementation SFBaseViewController

- (void)commonSFBaseViewControllerInit
{
	// Override in subclasses to customize initialization...
}

+ (NSString *)defaultNibName
{
	return [self defaultNibNameInBundle:[NSBundle mainBundle]];
}

+ (BOOL)_isXibWithName:(NSString *)xibName inBundle:(NSBundle *)bundle;
{
	if ([bundle pathForResource:xibName ofType:@"xib"] == nil) {
		return NO;
	}
    
	return YES;
}

- (NSString *)defaultNibName
{
	return [[self class] defaultNibName];
}

- (id)init
{
	return [self initWithNibName:[self defaultNibName] bundle:nil];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
	if ((self = [super initWithCoder:aDecoder])) {
		[self commonSFBaseViewControllerInit];
	}
    
	return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
		[self commonSFBaseViewControllerInit];
	}
    
	return self;
}

@end

@implementation SFBaseViewController (UnitTests)

+ (NSString *)defaultNibNameInBundle:(NSBundle *)bundle
{
	NSString *nibName;
	NSString *className = NSStringFromClass(self);
    
	nibName = [className stringByReplacingOccurrencesOfString:@"Controller" withString:@""];
    
	if ([self _isXibWithName:nibName inBundle:bundle] == NO) {
		NSString *reason = [NSString stringWithFormat:@"xib with name %@ not found for class %@", nibName, className];
		@throw [NSException exceptionWithName:NSInternalInconsistencyException reason:reason userInfo:nil];
	}
    
	return nibName;
}

- (NSString *)defaultNibNameInBundle:(NSBundle *)bundle;
{
	return [[self class] defaultNibNameInBundle:bundle];
}

@end
