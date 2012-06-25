//
//  UIView+FlexibleLayout.h
//
//  Created by Jonathan Klein on 6/24/12.
//  Copyright (c) 2012 Dear Panda LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (FlexibleLayout)

/**
 * Offsets the frame by pt, if the device is an iPhone.
 */
- (void)setIPhoneOffset:(CGPoint)pt;

/**
 * Offsets the frame by pt, if the device is an iPad.
 */
- (void)setIPadOffset:(CGPoint)pt;

@end
