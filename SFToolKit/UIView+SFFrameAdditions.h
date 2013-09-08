#import <UIKit/UIKit.h>


@interface UIView (SFFrameAdditions)

@property (nonatomic, assign) CGPoint sf_origin;
@property (nonatomic, assign) CGSize sf_size;
// normal rect properties
@property (nonatomic, assign) CGFloat sf_x;
@property (nonatomic, assign) CGFloat sf_y;
@property (nonatomic, assign) CGFloat sf_width;
@property (nonatomic, assign) CGFloat sf_height;
@property (nonatomic, assign) CGFloat sf_left;
// normal rect propertiessf_top, sf_right, sf_bottom; // these will stretch the rect

@end
