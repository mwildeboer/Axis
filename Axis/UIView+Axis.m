//
//  UIView+Axis.m
//  Axis
//
//  Created by Menno Wildeboer on 19/05/15.
//  Copyright (c) 2015 Menno Wildeboer. All rights reserved.
//

#import <math.h>
#import <objc/runtime.h>
#import "AXLayoutConstraint+Private.h"
#import "UIView+Axis.h"

@implementation UIView (AXLayoutMaker)

- (void)layout:(void (^)(AXLayoutMaker *make))layoutBlock
{
    NSParameterAssert(layoutBlock);

    AXLayoutMaker *maker = [[AXLayoutMaker alloc] init];
    layoutBlock(maker);
    [maker commitOnView:self];
}

#pragma mark - Accessors

- (AXLayoutConstraint *)left
{
    return [self constraintWithAttribute:AXLayoutAttributeLeft];
}

- (AXLayoutConstraint *)top
{
    return [self constraintWithAttribute:AXLayoutAttributeTop];
}

- (AXLayoutConstraint *)right
{
    return [self constraintWithAttribute:AXLayoutAttributeRight];
}

- (AXLayoutConstraint *)bottom
{
    return [self constraintWithAttribute:AXLayoutAttributeBottom];
}

- (AXLayoutConstraint *)width
{
    return [self constraintWithAttribute:AXLayoutAttributeWidth];
}

- (AXLayoutConstraint *)height
{
    return [self constraintWithAttribute:AXLayoutAttributeHeight];
}

- (AXLayoutConstraint *)centerX
{
    return [self constraintWithAttribute:AXLayoutAttributeCenterX];
}

- (AXLayoutConstraint *)centerY
{
    return [self constraintWithAttribute:AXLayoutAttributeCenterY];
}

#pragma mark - Private

- (AXViewLayoutConstraint *)constraintWithAttribute:(AXLayoutAttribute)attribute
{
    return [[AXViewLayoutConstraint alloc] initWithAttribute:attribute targetView:self];
}

@end

