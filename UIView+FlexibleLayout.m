//
//  UIView+FlexibleLayout.h
//
//  Created by Jonathan Klein on 6/24/12.
//  Copyright (c) 2012 DearPanda LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+FlexibleLayout.h"

@implementation UIView (FlexibleLayout)

- (void)offset:(CGPoint)pt {
  CGRect f = self.frame;
  self.frame = CGRectMake( f.origin.x + pt.x, f.origin.y + pt.y, f.size.width, f.size.height );
}

- (void)setIPhoneOffset:(CGPoint)pt {
  if( IS_IPHONE() ) {
    [ self offset: pt ];
  }
}

- (void)setIPadOffset:(CGPoint)pt {
  if( !IS_IPHONE() ) {
    [ self offset: pt ];
  }
}

/**
 * For any undefined key we get, figure out if it matches a known key with IPhone or IPad 
 * prefixed.  If so, we strip out the prefix, apply the condition, and forward the message.
 *
 * For example: 
 * setIPhoneHidden: => setHidden:, if IS_IPHONE()
 */

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
  BOOL condition = YES;
  NSString *newKey = nil;
  
  if( [ key rangeOfString: @"iPhone" ].location != NSNotFound ) {
    newKey = [ key stringByReplacingOccurrencesOfString: @"iPhone" withString: @"" ];
    condition = IS_IPHONE();
  } else if( [ key rangeOfString: @"iPad" ].location != NSNotFound ) {
    newKey = [ key stringByReplacingOccurrencesOfString: @"iPad" withString: @"" ];
    condition = !IS_IPHONE();
  }

  if( newKey ) {
    // lowercase the first character of the new key, but keep the rest of the string capitalization
    newKey = [ NSString stringWithFormat: @"%@%@", [ [ newKey substringToIndex: 1 ] lowercaseString ], [ newKey substringFromIndex: 1 ] ];

    if( condition )
      [ self setValue: value forKey: newKey ];
  } else {
    [ super setValue: value forUndefinedKey: key ];
  }
}

@end
