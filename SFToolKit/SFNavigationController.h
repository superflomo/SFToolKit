//
//  SFNavigationController.h
//  SFToolKit
//
//  Created by Florian Bürger on 25.04.13.
//  Copyright (c) 2013 superflomo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SFNavigationController : UINavigationController

@property (getter = sf_shouldDisablesAutomaticKeyboardDismissal) BOOL sf_disablesAutomaticKeyboardDismissal;

@end
