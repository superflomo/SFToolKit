//
//  SFBaseViewController.h
//  SFToolKit
//
//  Created by Florian Bürger on 15.04.13.
//  Copyright (c) 2013 superflomo. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *   Our base view controller.
 *   -init will call -initWithNibName:nibBundle: using -defaultNibName
 */
@interface SFBaseViewController : UIViewController

/**
 *   Called from  -initWithNibName:bundle: / -initWithCoder:
 *   Subclasses can override this to customize initialization...
 */
- (void)commonSFBaseViewControllerInit;

/**
 *   Returns the default nib name for instances of this class.
 *   Without any modifications, returns the class name without ...Controller
 */
+ (NSString *)defaultNibName;

/**
 *   See `+defaultNibName`
 */
- (NSString *)defaultNibName;


@end
