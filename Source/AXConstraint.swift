//
//  AXConstraint.swift
//  Axis
//
//  Created by Menno Wildeboer on 14/02/16.
//  Copyright © 2016 Menno Wideboer. All rights reserved.
//

import Foundation

public enum AXLayoutAttribute : Int {
  case Left
  case Right
  case Top
  case Bottom
  case Width
  case Height
  case CenterX
  case CenterY
  case None
}

public class AXConstraint {
  public var firstAttribute: AXLayoutAttribute
  public var firstView: UIView
  public var secondAttribute: AXLayoutAttribute = .None
  public var secondView: UIView?  
  public var constant: CGFloat = 0
  public var offset: CGFloat = 0
  public var multiplier: CGFloat = 1.0
  
  internal init(attribute firstAttribute: AXLayoutAttribute, view firstView: UIView, attribute secondAttribute: AXLayoutAttribute = .None, view secondView: UIView? = nil, offset: CGFloat = 0, multiplier: CGFloat = 1.0, constant: CGFloat = 0) {
    self.firstAttribute = firstAttribute
    self.firstView = firstView
    self.secondAttribute = secondAttribute
    self.secondView = secondView
    self.offset = offset
    self.multiplier = multiplier
    self.constant = constant
  }
}

public func == (lhs: AXDimension, rhs: CGFloat)  {
  lhs.context.applyConstraint(AXConstraint(attribute: lhs.attribute, view: lhs.view, constant: rhs))
}

public func == (lhs: AXDimension, rhs: AXDimension) {
  lhs.context.applyConstraint(AXConstraint(attribute: lhs.attribute, view: lhs.view, attribute: rhs.attribute, view: rhs.view))
}

public func == (lhs: AXDimension, rhs: AXConstraint) {
  lhs.context.applyConstraint(AXConstraint(attribute: lhs.attribute, view: lhs.view, attribute: rhs.firstAttribute, view: rhs.firstView, offset: rhs.offset, multiplier: rhs.multiplier, constant: rhs.constant))
}

public func + (lhs: AXDimension, rhs: CGFloat) -> AXConstraint {
  return AXConstraint(attribute: lhs.attribute, view: lhs.view, offset: rhs)
}

public func + (lhs: AXConstraint, rhs: CGFloat) -> AXConstraint {
  return AXConstraint(attribute: lhs.firstAttribute, view: lhs.firstView, attribute: lhs.secondAttribute, view: lhs.secondView, offset: rhs, multiplier: lhs.multiplier, constant: lhs.constant)
}

public func - (lhs: AXDimension, rhs: CGFloat) -> AXConstraint {
  return AXConstraint(attribute: lhs.attribute, view: lhs.view, offset: -rhs)
}

public func - (lhs: AXConstraint, rhs: CGFloat) -> AXConstraint {
  return AXConstraint(attribute: lhs.firstAttribute, view: lhs.firstView, attribute: lhs.secondAttribute, view: lhs.secondView, offset: -rhs, multiplier: lhs.multiplier, constant: lhs.constant)
}

public func * (lhs: AXDimension, rhs: CGFloat) -> AXConstraint {
  return AXConstraint(attribute: lhs.attribute, view: lhs.view, multiplier: rhs)
}

public func * (lhs: AXConstraint, rhs: CGFloat) -> AXConstraint {
  return AXConstraint(attribute: lhs.firstAttribute, view: lhs.firstView, attribute: lhs.secondAttribute, view: lhs.secondView, offset: lhs.offset, multiplier: rhs, constant: lhs.constant)
}

public func / (lhs: AXDimension, rhs: CGFloat) -> AXConstraint {
  return AXConstraint(attribute: lhs.attribute, view: lhs.view, multiplier: 1/rhs)
}

public func / (lhs: AXConstraint, rhs: CGFloat) -> AXConstraint {
  return AXConstraint(attribute: lhs.firstAttribute, view: lhs.firstView, attribute: lhs.secondAttribute, view: lhs.secondView, offset: lhs.offset, multiplier: 1/rhs, constant: lhs.constant)
}
