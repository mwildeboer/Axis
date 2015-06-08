//
//  AXLayoutConstraint.h
//  Axis
//
//  Created by Menno Wildeboer on 02/06/15.
//  Copyright (c) 2015 Menno Wildeboer. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AXLayoutConstraint : NSObject 

- (void)equalTo:(id)value;
- (void)equalTo:(id)value withMultiplier:(CGFloat)multiplier;
- (void)equalTo:(id)value withMultiplier:(CGFloat)multiplier andOffset:(CGFloat)offset;
- (void)equalTo:(id)value withOffset:(CGFloat)offset;
- (void)equalTo:(id)value withOffset:(CGFloat)offset andMultiplier:(CGFloat)multiplier;

@end
