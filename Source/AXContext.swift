//
//  AXContext.swift
//  Axis
//
//  Created by Menno Wildeboer on 14/02/16.
//  Copyright © 2016 Menno Wideboer. All rights reserved.
//

import Foundation

public class AXContext {
  internal var constraints: [ AXLayoutAttribute: AXConstraint ] = [ AXLayoutAttribute: AXConstraint ]()
  
  internal func applyConstraint(c: AXConstraint) {
    self.constraints[c.firstAttribute] = c
  }
  
  internal func installConstraints() {
        
    if self.constraints.isEmpty {
      return
    }
    
    let view = self.constraints.values.first!.firstView
    var frame = view.frame
    
    /////////////////////////////////////////////////////////////////////////////
    // HORIZONTAL
    /////////////////////////////////////////////////////////////////////////////
    
    if let c = self.constraints[.Width] {
      if c.secondAttribute == .Width {
        frame.size.width = CGRectGetWidth(c.secondView!.frame) * c.multiplier + c.offset
      } else if c.secondAttribute == .Height {
        frame.size.width = CGRectGetHeight(c.secondView!.frame) * c.multiplier + c.offset
      } else if c.secondAttribute == .None {
        frame.size.width = c.constant
      }
    }

    if let c = self.constraints[.Left] {
      if c.secondAttribute == .Left {
        frame.origin.x = CGRectGetMinX(c.secondView!.frame) * c.multiplier + c.offset
      } else if c.secondAttribute == .Right {
        frame.origin.x = CGRectGetMaxX(c.secondView!.frame) * c.multiplier + c.offset
      } else if c.secondAttribute == .None {
        frame.origin.x = c.constant
      }
      
      if let c = self.constraints[.Right] {
        if self.constraints[.Width] == nil {
          if c.secondAttribute == .Right {
            frame.size.width = max(0, (CGRectGetMaxX(c.secondView!.frame) * c.multiplier + c.offset) - CGRectGetMinX(frame))
          } else if (c.secondAttribute == .Left) {
            frame.size.width = max(0, (CGRectGetMinX(c.secondView!.frame) * c.multiplier + c.offset) - CGRectGetMinX(frame))
          } else if c.secondAttribute == .None && c.firstView.superview != nil {
            frame.size.width = max(0, (CGRectGetMaxX(c.firstView.frame) - c.constant) - CGRectGetMinX(frame))
          }
        }
      }
    }
    else if let c = self.constraints[.Right] {
      if c.secondAttribute == .Right {
        frame.origin.x = max(0, (CGRectGetMaxX(c.secondView!.frame) * c.multiplier + c.offset) - CGRectGetMinX(frame))
      } else if (c.secondAttribute == .Left) {
        frame.origin.x = (CGRectGetMinX(c.secondView!.frame) * c.multiplier + c.offset) - CGRectGetWidth(frame)
      } else if c.secondAttribute == .None && c.secondView!.superview != nil {
        frame.origin.x = CGRectGetWidth(c.secondView!.superview!.frame) - c.constant - CGRectGetWidth(frame)
      }
    }
    else if let c = self.constraints[.CenterX] {
      if c.secondAttribute == .CenterX {
        if (c.secondView! == c.firstView.superview) {
          frame.origin.x = (CGRectGetWidth(c.secondView!.bounds)/2 * c.multiplier + c.offset) - CGRectGetWidth(frame)/2
        } else {
          frame.origin.x = (CGRectGetMidX(c.secondView!.frame) * c.multiplier + c.offset) - CGRectGetWidth(frame)/2
        }
      } else if c.secondAttribute == .None  {
        frame.origin.x = c.constant - CGRectGetWidth(frame)/2
      }
    }
    
    /////////////////////////////////////////////////////////////////////////////
    // VERTICAL
    /////////////////////////////////////////////////////////////////////////////
    
    if let c = self.constraints[.Height] {
      if c.secondAttribute == .Width {
        frame.size.height = CGRectGetWidth(c.secondView!.frame) * c.multiplier + c.offset
      } else if c.secondAttribute == .Height {
        frame.size.height = CGRectGetHeight(c.secondView!.frame) * c.multiplier + c.offset
      } else if c.secondAttribute == .None {
        frame.size.height = c.constant
      }
    }

    if let c = self.constraints[.Top] {
      if c.secondAttribute == .Top {
        frame.origin.y = CGRectGetMinY(c.secondView!.frame) * c.multiplier + c.offset
      } else if c.secondAttribute == .Bottom {
        frame.origin.y = CGRectGetMaxY(c.secondView!.frame) * c.multiplier + c.offset
      } else if c.secondAttribute == .None {
        frame.origin.y = c.constant
      }
      
      if let c = self.constraints[.Bottom] {
        if self.constraints[.Height] == nil {
          if c.secondAttribute == .Bottom {
            frame.size.height = max(0, (CGRectGetMaxY(c.secondView!.frame) * c.multiplier - c.offset) - CGRectGetMinY(frame))
          } else if (c.secondAttribute == .Left) {
            frame.size.height = max(0, (CGRectGetMinY(c.secondView!.frame) * c.multiplier - c.offset) - CGRectGetMinY(frame))
          } else if c.secondAttribute == .None && c.firstView.superview != nil {
            frame.size.height = max(0, (CGRectGetMaxY(c.firstView.frame) - c.constant) - CGRectGetMinY(frame))
          }
        }
      }
    }
    else if let c = self.constraints[.Bottom] {
      if c.secondAttribute == .Bottom {
        frame.origin.y = max(0, (CGRectGetMaxY(c.secondView!.frame) * c.multiplier - c.offset) - CGRectGetMinY(frame))
      } else if (c.secondAttribute == .Left) {
        frame.origin.y = (CGRectGetMinY(c.secondView!.frame) * c.multiplier - c.offset) - CGRectGetHeight(frame)
      } else if c.secondAttribute == .None && c.secondView!.superview != nil {
        frame.origin.y = CGRectGetHeight(c.secondView!.superview!.frame) - c.constant - CGRectGetHeight(frame)
      }
    }
    else if let c = self.constraints[.CenterY] {
      if c.secondAttribute == .CenterY {
        if (c.secondView! == c.firstView.superview) {
          frame.origin.y = (CGRectGetHeight(c.secondView!.bounds)/2 * c.multiplier + c.offset) - CGRectGetHeight(frame)/2
        } else {
          frame.origin.y = (CGRectGetMidY(c.secondView!.frame) * c.multiplier + c.offset) - CGRectGetHeight(frame)/2
        }
      } else if c.secondAttribute == .None  {
        frame.origin.y = c.constant - CGRectGetHeight(frame)/2
      }
    }

    /////////////////////////////////////////////////////////////////////////////
    // APPLY
    /////////////////////////////////////////////////////////////////////////////
    
    view.frame = CGRectIntegral(frame)
  }
}