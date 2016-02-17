//
//  AXLayoutConstraint.m
//  Axis
//
//  Created by Menno Wildeboer on 02/06/15.
//  Copyright (c) 2015 Menno Wildeboer. All rights reserved.
//

#import "AXLayoutConstraint+Private.h"

@implementation AXLayoutConstraint

- (void)equalTo:(id)value
{
    [self equalTo:value withOffset:0.0 andMultiplier:1.0];
}

- (void)equalTo:(id)value withMultiplier:(CGFloat)multiplier
{
    [self equalTo:value withOffset:0.0 andMultiplier:multiplier];
}

- (void)equalTo:(id)value withMultiplier:(CGFloat)multiplier andOffset:(CGFloat)offset
{
    [self equalTo:value withOffset:offset andMultiplier:multiplier];
}

- (void)equalTo:(id)value withOffset:(CGFloat)offset
{
    [self equalTo:value withOffset:offset andMultiplier:1.0];
}

- (void)equalTo:(id)value withOffset:(CGFloat)offset andMultiplier:(CGFloat)multiplier
{
    if ([value isKindOfClass:[AXViewLayoutConstraint class]])
    {
        self.constantValue = NAN;
        self.multiplier = multiplier;
        self.offset = offset;
        self.targetAttribute = [value targetAttribute];
        self.targetView = [value targetView];
    }
    else if ([value isKindOfClass:[NSNumber class]])
    {
        self.constantValue = [value floatValue];
        self.multiplier = multiplier;
        self.offset = offset;
        self.targetAttribute = AXLayoutAttributeNone;
        self.targetView = nil;
    }
}


#pragma mark - Private

- (instancetype)initWithAttribute:(AXLayoutAttribute)attribute
{
    self = [super init];
    if (self)
    {
//        self.constraintAttribute = attribute;
        self.targetAttribute = AXLayoutAttributeNone;
    }
    return self;
}

@end

@implementation AXViewLayoutConstraint

- (instancetype)initWithAttribute:(AXLayoutAttribute)attribute targetView:(UIView *)targetView
{
    self = [super init];
    if (self)
    {
        self.targetAttribute = attribute;
        self.targetView = targetView;
    }
    return self;
}

@end
