//
//  UIView+Axis.h
//  Axis
//
//  Created by Menno Wildeboer on 19/05/15.
//  Copyright (c) 2015 Menno Wildeboer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AXLayoutMaker.h"

@interface UIView (AXLayoutMaker)

@property (nonatomic, strong, readonly) AXLayoutConstraint *left;
@property (nonatomic, strong, readonly) AXLayoutConstraint *top;
@property (nonatomic, strong, readonly) AXLayoutConstraint *right;
@property (nonatomic, strong, readonly) AXLayoutConstraint *bottom;
@property (nonatomic, strong, readonly) AXLayoutConstraint *width;
@property (nonatomic, strong, readonly) AXLayoutConstraint *height;
@property (nonatomic, strong, readonly) AXLayoutConstraint *centerX;
@property (nonatomic, strong, readonly) AXLayoutConstraint *centerY;

- (void)layout:(void (^)(AXLayoutMaker *make))layoutBlock;

- (void)equalToSuperview;
- (void)equalToSuperviewWithInsets:(UIEdgeInsets)insets;

@end
