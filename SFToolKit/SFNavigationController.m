//
//  SFNavigationController.m
//  SFToolKit
//
//  Created by Florian Bürger on 25.04.13.
//  Copyright (c) 2013 superflomo. All rights reserved.
//

#import "SFNavigationController.h"

@interface SFNavigationController ()

@end

@implementation SFNavigationController

- (BOOL)disablesAutomaticKeyboardDismissal
{
    return [self sf_shouldDisablesAutomaticKeyboardDismissal];
}

@end
