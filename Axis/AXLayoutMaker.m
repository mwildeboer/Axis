//
//  AXLayoutMaker.m
//  Axis
//
//  Created by Menno Wildeboer on 02/06/15.
//  Copyright (c) 2015 Menno Wildeboer. All rights reserved.
//

#import "AXLayoutConstraint+Private.h"
#import "AXLayoutMaker.h"

@interface AXLayoutMaker ()

@property (nonatomic, strong, readwrite) AXLayoutConstraint *left;
@property (nonatomic, strong, readwrite) AXLayoutConstraint *top;
@property (nonatomic, strong, readwrite) AXLayoutConstraint *right;
@property (nonatomic, strong, readwrite) AXLayoutConstraint *bottom;
@property (nonatomic, strong, readwrite) AXLayoutConstraint *width;
@property (nonatomic, strong, readwrite) AXLayoutConstraint *height;
@property (nonatomic, strong, readwrite) AXLayoutConstraint *centerX;
@property (nonatomic, strong, readwrite) AXLayoutConstraint *centerY;

@property (nonatomic, assign) AXLayoutAttribute horizontalAttributes;
@property (nonatomic, assign) AXLayoutAttribute verticalAttributes;

@end

@implementation AXLayoutMaker

- (void)commitOnView:(UIView *)view
{
    CGRect frame = view.frame;
    
    [self updateFrame:&frame withHorizonalConstraintsOnView:view];
    [self updateFrame:&frame withVerticalConstraintsOnView:view];
    
    view.frame = frame;
}

- (void)updateFrame:(CGRect *)frame withHorizonalConstraintsOnView:(UIView *)view
{
    CGRect newFrame = *frame;
    
    if (self.horizontalAttributes & AXLayoutAttributeWidth)
    {
        if (!_width.targetAttribute == AXLayoutAttributeNone)
        {
            if (_width.targetAttribute == AXLayoutAttributeWidth) {
                newFrame.size.width = CGRectGetWidth(_width.targetView.frame) * _width.multiplier;
            }
            else if (_width.targetAttribute == AXLayoutAttributeHeight) {
                newFrame.size.width = CGRectGetHeight(_width.targetView.frame) * _width.multiplier;
            }
        }
        else {
            newFrame.size.width = _width.constantValue;
        }
    }
    
    if (self.horizontalAttributes & AXLayoutAttributeLeft)
    {
        if (!_left.targetAttribute == AXLayoutAttributeNone)
        {
            if (_left.targetAttribute == AXLayoutAttributeLeft) {
                newFrame.origin.x = CGRectGetMinX(_left.targetView.frame) * _left.multiplier + _left.offset;
            }
            else if (_left.targetAttribute == AXLayoutAttributeRight) {
                newFrame.origin.x = CGRectGetMaxX(_left.targetView.frame) * _left.multiplier + _left.offset;
            }
        }
        else {
            newFrame.origin.x = _left.constantValue;
        }
        

        if (self.horizontalAttributes & AXLayoutAttributeRight && !(self.horizontalAttributes & AXLayoutAttributeWidth))
        {
            if (!_right.targetAttribute == AXLayoutAttributeNone)
            {
                if (_right.targetAttribute == AXLayoutAttributeRight) {
                    newFrame.size.width = MAX(0, (CGRectGetMaxX(_right.targetView.frame) * _right.multiplier - _right.offset) - CGRectGetMinX(newFrame));
                }
                else if (_right.targetAttribute == AXLayoutAttributeLeft) {
                    newFrame.size.width = MAX(0, (CGRectGetMinX(_right.targetView.frame) * _right.multiplier - _right.offset) - CGRectGetMinX(newFrame));
                }
            } else if (view.superview != nil) {
                newFrame.size.width = MAX(0, (CGRectGetMaxX(view.superview.frame) - _right.constantValue) - CGRectGetMinX(newFrame));
            }
        }
    }
    else if (self.horizontalAttributes & AXLayoutAttributeRight)
    {
        if (!_right.targetAttribute == AXLayoutAttributeNone)
        {
            if (_right.targetAttribute == AXLayoutAttributeRight) {
                newFrame.origin.x = (CGRectGetMaxX(_right.targetView.frame) * _right.multiplier - _right.offset) - CGRectGetWidth(newFrame);
            }
            else if (_right.targetAttribute == AXLayoutAttributeLeft) {
                newFrame.origin.x = (CGRectGetMinX(_right.targetView.frame) * _right.multiplier - _right.offset) - CGRectGetWidth(newFrame);
            }
        } else {
            newFrame.origin.x = _right.constantValue - CGRectGetWidth(newFrame);
        }
    }
    else if (self.horizontalAttributes & AXLayoutAttributeCenterX)
    {
        if (!_centerX.targetAttribute == AXLayoutAttributeNone)
        {
            if (_centerX.targetAttribute == AXLayoutAttributeCenterX) {
                newFrame.origin.x = (CGRectGetMidX(_centerX.targetView.frame) * _centerX.multiplier + _centerX.offset) - CGRectGetWidth(newFrame)/2;
            }
            else if (_right.targetAttribute == AXLayoutAttributeLeft) {
                newFrame.origin.x = (CGRectGetMaxX(_centerX.targetView.frame) * _centerX.multiplier + _centerX.offset) - CGRectGetWidth(newFrame)/2;
            }
            else if (_right.targetAttribute == AXLayoutAttributeRight) {
                newFrame.origin.x = (CGRectGetMinX(_centerX.targetView.frame) * _centerX.multiplier - _centerX.offset) - CGRectGetWidth(newFrame)/2;
            }
        } else {
            newFrame.origin.x = _centerX.constantValue - CGRectGetWidth(newFrame)/2;
        }
    }
    
    *frame = newFrame;
}

- (void)updateFrame:(CGRect *)frame withVerticalConstraintsOnView:(UIView *)view
{
    CGRect newFrame = *frame;
    if (self.verticalAttributes & AXLayoutAttributeHeight)
    {
        if (_height.targetAttribute != AXLayoutAttributeNone)
        {
            if (_height.targetAttribute == AXLayoutAttributeWidth) {
                newFrame.size.height = CGRectGetWidth(_height.targetView.frame) * _height.multiplier;
            }
            else if (_height.targetAttribute == AXLayoutAttributeHeight) {
                newFrame.size.height = CGRectGetHeight(_height.targetView.frame) * _height.multiplier;
            }
        }
        else {
            newFrame.size.height = _height.constantValue;
        }
    }
    
    if (self.verticalAttributes & AXLayoutAttributeTop)
    {
        if (_top.targetAttribute != AXLayoutAttributeNone)
        {
            if (_top.targetAttribute == AXLayoutAttributeTop) {
                newFrame.origin.y = CGRectGetMinY(_top.targetView.frame) * _top.multiplier + _top.offset;
            }
            else if (_top.targetAttribute == AXLayoutAttributeBottom) {                
                newFrame.origin.y = CGRectGetMaxY(_top.targetView.frame) * _top.multiplier + _top.offset;
            }
        }
        else {
            newFrame.origin.y = _top.constantValue;
        }
        
        if (self.verticalAttributes & AXLayoutAttributeBottom && !(self.verticalAttributes & AXLayoutAttributeHeight))
        {
            if (_bottom.targetAttribute != AXLayoutAttributeNone)
            {
                if (_bottom.targetAttribute == AXLayoutAttributeBottom) {
                    newFrame.size.height = MAX(0, (CGRectGetMaxY(_bottom.targetView.frame) * _bottom.multiplier - _bottom.offset) - CGRectGetMinY(newFrame));
                    
                }
                else if (_bottom.targetAttribute == AXLayoutAttributeTop) {
                    newFrame.size.height = MAX(0, (CGRectGetMinY(_bottom.targetView.frame) * _bottom.multiplier - _bottom.offset) - CGRectGetMinY(newFrame));
                }
            } else if (view.superview != nil) {
                newFrame.size.height = MAX(0, CGRectGetMaxY(view.superview.frame) - _bottom.constantValue - CGRectGetMinY(newFrame));
            }
        }
    }
    else if (self.verticalAttributes & AXLayoutAttributeBottom)
    {
        if (!_bottom.targetAttribute == AXLayoutAttributeNone)
        {
            if (_bottom.targetAttribute == AXLayoutAttributeBottom) {
                newFrame.origin.y = (CGRectGetMaxY(_bottom.targetView.frame) * _bottom.multiplier - _bottom.offset) - CGRectGetHeight(newFrame);
            }
            else if (_bottom.targetAttribute == AXLayoutAttributeTop) {
                newFrame.origin.y = (CGRectGetMinY(_bottom.targetView.frame) * _bottom.multiplier - _bottom.offset) - CGRectGetHeight(newFrame);
            }
        } else {
            newFrame.origin.y = _bottom.constantValue - CGRectGetHeight(newFrame);
        }
    }
    else if (self.verticalAttributes & AXLayoutAttributeCenterY)
    {
        if (!_centerY.targetAttribute == AXLayoutAttributeNone)
        {
            if (_centerY.targetAttribute == AXLayoutAttributeCenterY) {
                newFrame.origin.y = (CGRectGetMidY(_centerY.targetView.frame) * _centerY.multiplier + _centerY.offset) - CGRectGetHeight(newFrame)/2;
            }
            else if (_right.targetAttribute == AXLayoutAttributeTop) {
                newFrame.origin.y = (CGRectGetMaxY(_centerY.targetView.frame) * _centerY.multiplier + _centerY.offset) - CGRectGetHeight(newFrame)/2;
            }
            else if (_right.targetAttribute == AXLayoutAttributeBottom) {
                newFrame.origin.y = (CGRectGetMinY(_centerY.targetView.frame) * _centerY.multiplier - _centerY.offset) - CGRectGetHeight(newFrame)/2;
            }
        } else {
            newFrame.origin.y = _centerY.constantValue - CGRectGetHeight(newFrame)/2;
        }
    }
    
    *frame = newFrame;
}

#pragma mark - Accessors

- (AXLayoutConstraint *)left
{
    if (_left == nil)
    {
        _left = [[AXLayoutConstraint alloc] initWithAttribute:AXLayoutAttributeLeft];
        _horizontalAttributes |= AXLayoutAttributeLeft;
    }
    return _left;
}

- (AXLayoutConstraint *)top
{
    if (_top == nil)
    {
        _top = [[AXLayoutConstraint alloc] initWithAttribute:AXLayoutAttributeTop];
        _verticalAttributes |= AXLayoutAttributeTop;
    }
    return _top;
}

- (AXLayoutConstraint *)right
{
    if (_right == nil)
    {
        _right = [[AXLayoutConstraint alloc] initWithAttribute:AXLayoutAttributeRight];
        _horizontalAttributes |= AXLayoutAttributeRight;
    }
    return _right;
}

- (AXLayoutConstraint *)bottom
{
    if (_bottom == nil)
    {
        _bottom = [[AXLayoutConstraint alloc] initWithAttribute:AXLayoutAttributeBottom];
        _verticalAttributes |= AXLayoutAttributeBottom;
    }
    return _bottom;
}

- (AXLayoutConstraint *)width
{
    if (_width == nil)
    {
        _width = [[AXLayoutConstraint alloc] initWithAttribute:AXLayoutAttributeWidth];
        _horizontalAttributes |= AXLayoutAttributeWidth;
    }
    return _width;
}

- (AXLayoutConstraint *)height
{
    if (_height == nil)
    {
        _height = [[AXLayoutConstraint alloc] initWithAttribute:AXLayoutAttributeHeight];
        _verticalAttributes |= AXLayoutAttributeHeight;
    }
    return _height;
}

- (AXLayoutConstraint *)centerX
{
    if (_centerX == nil)
    {
        _centerX = [[AXLayoutConstraint alloc] initWithAttribute:AXLayoutAttributeCenterX];
        _horizontalAttributes |= AXLayoutAttributeCenterX;
    }
    return _centerX;
}

- (AXLayoutConstraint *)centerY
{
    if (_centerY == nil)
    {
        _centerY = [[AXLayoutConstraint alloc] initWithAttribute:AXLayoutAttributeCenterY];
        _verticalAttributes |= AXLayoutAttributeCenterY;
    }
    return _centerY;
}


@end
