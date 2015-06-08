//
//  AXLayoutConstraint+Private.h
//  Axis
//
//  Created by Menno Wildeboer on 03/06/15.
//  Copyright (c) 2015 Menno Wildeboer. All rights reserved.
//

#import "AXLayoutConstraint.h"

typedef NS_OPTIONS(NSUInteger, AXLayoutAttribute)
{
    AXLayoutAttributeLeft    = 1 << 0,
    AXLayoutAttributeTop     = 1 << 1,
    AXLayoutAttributeRight   = 1 << 2,
    AXLayoutAttributeBottom  = 1 << 3,
    AXLayoutAttributeWidth   = 1 << 4,
    AXLayoutAttributeHeight  = 1 << 5,
    AXLayoutAttributeCenterX = 1 << 6,
    AXLayoutAttributeCenterY = 1 << 7,
    AXLayoutAttributeNone    = 0
};

@interface AXLayoutConstraint ()

@property (nonatomic, assign) AXLayoutAttribute constraintAttribute;
@property (nonatomic, assign) AXLayoutAttribute targetAttribute;
@property (nonatomic, assign) UIView           *targetView;

@property (nonatomic, assign) CGFloat multiplier;
@property (nonatomic, assign) CGFloat offset;
@property (nonatomic, assign) CGFloat constantValue;

- (instancetype)initWithAttribute:(AXLayoutAttribute)attribute;

@end

@interface AXViewLayoutConstraint : AXLayoutConstraint

- (instancetype)initWithAttribute:(AXLayoutAttribute)attribute targetView:(UIView *)targetView;

@end