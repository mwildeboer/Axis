//
//  AXViewContext.swift
//  Axis
//
//  Created by Menno Wildeboer on 05/02/16.
//  Copyright © 2016 Menno Wideboer. All rights reserved.
//

import UIKit

public class AXViewContext {
  internal let view: UIView
  internal let context: AXContext
  
  lazy public var left: AXDimension = { return AXDimension(attribute: .Left, context: self.context, view: self.view) }()
  lazy public var top: AXDimension = { return AXDimension(attribute: .Top, context: self.context, view: self.view) }()
  lazy public var right: AXDimension = { return AXDimension(attribute: .Right, context: self.context, view: self.view) }()
  lazy public var bottom: AXDimension = { return AXDimension(attribute: .Bottom, context: self.context, view: self.view) }()
  lazy public var width: AXDimension = { return AXDimension(attribute: .Width, context: self.context, view: self.view) }()
  lazy public var height: AXDimension = { return AXDimension(attribute: .Height, context: self.context, view: self.view) }()
  lazy public var centerX: AXDimension = { return AXDimension(attribute: .CenterX, context: self.context, view: self.view) }()
  lazy public var centerY: AXDimension = { return AXDimension(attribute: .CenterY, context: self.context, view: self.view) }()
  
  public var superview: AXViewContext? {
    if let superview = view.superview {
      return AXViewContext(superview, context)
    }
    return nil
  }
  
  init(_ view: UIView, _ context: AXContext) {
    self.context = context
    self.view = view
  }
}
