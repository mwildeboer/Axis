//
//  UIView+Axis.swift
//  Axis
//
//  Created by Menno Wildeboer on 17/02/16.
//  Copyright © 2016 Menno Wideboer. All rights reserved.
//

import UIKit

public extension UIView {
  
  public func fillSuperview(insets: UIEdgeInsets = UIEdgeInsetsZero) {
    if let superview = self.superview {
      var frame = superview.bounds
      frame.origin.x += insets.left
      frame.origin.y += insets.top
      frame.size.width -= (insets.left + insets.right)
      frame.size.height -= (insets.top + insets.bottom)
      self.frame = frame
    }
  }
}