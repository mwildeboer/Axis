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

static void *kUIViewConstraintKeyLeft = &kUIViewConstraintKeyLeft;
static void *kUIViewConstraintKeyTop = &kUIViewConstraintKeyTop;
static void *kUIViewConstraintKeyRight = &kUIViewConstraintKeyRight;
static void *kUIViewConstraintKeyBottom = &kUIViewConstraintKeyBottom;
static void *kUIViewConstraintKeyWidth = &kUIViewConstraintKeyWidth;
static void *kUIViewConstraintKeyHeight = &kUIViewConstraintKeyBottom;
static void *kUIViewConstraintKeyCenterX = &kUIViewConstraintKeyCenterX;
static void *kUIViewConstraintKeyCenterY = &kUIViewConstraintKeyCenterY;

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
    return [self constraintWithAttribute:AXLayoutAttributeLeft andKey:kUIViewConstraintKeyLeft];
}

- (AXLayoutConstraint *)top
{
    return [self constraintWithAttribute:AXLayoutAttributeTop andKey:kUIViewConstraintKeyTop];
}

- (AXLayoutConstraint *)right
{
    return [self constraintWithAttribute:AXLayoutAttributeRight andKey:kUIViewConstraintKeyRight];
}

- (AXLayoutConstraint *)bottom
{
    return [self constraintWithAttribute:AXLayoutAttributeBottom andKey:kUIViewConstraintKeyBottom];
}

- (AXLayoutConstraint *)width
{
    return [self constraintWithAttribute:AXLayoutAttributeWidth andKey:kUIViewConstraintKeyWidth];
}

- (AXLayoutConstraint *)height
{
    return [self constraintWithAttribute:AXLayoutAttributeHeight andKey:kUIViewConstraintKeyHeight];
}

- (AXLayoutConstraint *)centerX
{
    return [self constraintWithAttribute:AXLayoutAttributeCenterX andKey:kUIViewConstraintKeyCenterX];
}

- (AXLayoutConstraint *)centerY
{
    return [self constraintWithAttribute:AXLayoutAttributeCenterY andKey:kUIViewConstraintKeyCenterY];
}

#pragma mark - Private

- (AXViewLayoutConstraint *)constraintWithAttribute:(AXLayoutAttribute)attribute andKey:(const void *)key
{
    AXViewLayoutConstraint *constraint = objc_getAssociatedObject(self, key);
    if (!constraint) {
        constraint = [[AXViewLayoutConstraint alloc] initWithAttribute:attribute targetView:self];
        objc_setAssociatedObject(self, key, constraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return constraint;
}

@end

