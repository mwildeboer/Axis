//
//  AXLayoutMaker.h
//  Axis
//
//  Created by Menno Wildeboer on 02/06/15.
//  Copyright (c) 2015 Menno Wildeboer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AXLayoutConstraint.h"

@interface AXLayoutMaker : NSObject

@property (nonatomic, strong, readonly) AXLayoutConstraint *left;
@property (nonatomic, strong, readonly) AXLayoutConstraint *top;
@property (nonatomic, strong, readonly) AXLayoutConstraint *right;
@property (nonatomic, strong, readonly) AXLayoutConstraint *bottom;
@property (nonatomic, strong, readonly) AXLayoutConstraint *width;
@property (nonatomic, strong, readonly) AXLayoutConstraint *height;
@property (nonatomic, strong, readonly) AXLayoutConstraint *centerX;
@property (nonatomic, strong, readonly) AXLayoutConstraint *centerY;

- (void)commitOnView:(UIView *)view;

@end

