//
//  AXDimension.swift
//  Axis
//
//  Created by Menno Wildeboer on 10/02/16.
//  Copyright © 2016 Menno Wideboer. All rights reserved.
//

import UIKit

public struct AXDimension {
  public var attribute: AXLayoutAttribute
  public var context: AXContext
  public var view: UIView
  
  internal init(attribute: AXLayoutAttribute = .None, context: AXContext, view: UIView) {
    self.attribute = attribute
    self.context = context
    self.view = view
  }
}
