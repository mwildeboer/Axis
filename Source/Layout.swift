//
//  Layout.swift
//  Axis
//
//  Created by Menno Wildeboer on 14/02/16.
//  Copyright © 2016 Menno Wideboer. All rights reserved.
//

import Foundation

public func layout(view: UIView, @noescape block: (AXViewContext) -> ()) {
  let context = AXContext()
  block(AXViewContext(view, context))
  context.installConstraints()
}

public func layout(view1: UIView, _ view2: UIView, @noescape block: (AXViewContext, AXViewContext) -> ()) {
  let context1 = AXContext()
  let context2 = AXContext()

  block(
    AXViewContext(view1, context1),
    AXViewContext(view2, context2)
  )
  
  context1.installConstraints()
  context2.installConstraints()
}

public func layout(view1: UIView, _ view2: UIView, _ view3: UIView, @noescape block: (AXViewContext, AXViewContext, AXViewContext) -> ()) {
  let context1 = AXContext()
  let context2 = AXContext()
  let context3 = AXContext()
  
  block(
    AXViewContext(view1, context1),
    AXViewContext(view2, context2),
    AXViewContext(view3, context3)
  )
  
  context1.installConstraints()
  context2.installConstraints()
  context3.installConstraints()
}

public func layout(view1: UIView, _ view2: UIView, _ view3: UIView, _ view4: UIView, @noescape block: (AXViewContext, AXViewContext, AXViewContext, AXViewContext) -> ()) {
  let context1 = AXContext()
  let context2 = AXContext()
  let context3 = AXContext()
  let context4 = AXContext()
  
  block(
    AXViewContext(view1, context1),
    AXViewContext(view2, context2),
    AXViewContext(view3, context3),
    AXViewContext(view4, context4)
  )
  
  context1.installConstraints()
  context2.installConstraints()
  context3.installConstraints()
  context4.installConstraints()
}

public func layout(view1: UIView, _ view2: UIView, _ view3: UIView, _ view4: UIView, _ view5: UIView, @noescape block: (AXViewContext, AXViewContext, AXViewContext, AXViewContext, AXViewContext) -> ()) {
  let context1 = AXContext()
  let context2 = AXContext()
  let context3 = AXContext()
  let context4 = AXContext()
  let context5 = AXContext()
  
  block(
    AXViewContext(view1, context1),
    AXViewContext(view2, context2),
    AXViewContext(view3, context3),
    AXViewContext(view4, context4),
    AXViewContext(view5, context5)
  )
  
  context1.installConstraints()
  context2.installConstraints()
  context3.installConstraints()
  context4.installConstraints()
  context5.installConstraints()
}

public func layout(view1: UIView, _ view2: UIView, _ view3: UIView, _ view4: UIView, _ view5: UIView, _ view6: UIView, @noescape block: (AXViewContext, AXViewContext, AXViewContext, AXViewContext, AXViewContext, AXViewContext) -> ()) {
  let context1 = AXContext()
  let context2 = AXContext()
  let context3 = AXContext()
  let context4 = AXContext()
  let context5 = AXContext()
  let context6 = AXContext()
  
  block(
    AXViewContext(view1, context1),
    AXViewContext(view2, context2),
    AXViewContext(view3, context3),
    AXViewContext(view4, context4),
    AXViewContext(view5, context5),
    AXViewContext(view6, context6)
  )
  
  context1.installConstraints()
  context2.installConstraints()
  context3.installConstraints()
  context4.installConstraints()
  context5.installConstraints()
  context6.installConstraints()
}

public func layout(view1: UIView, _ view2: UIView, _ view3: UIView, _ view4: UIView, _ view5: UIView, _ view6: UIView, _ view7: UIView, @noescape block:  (AXViewContext, AXViewContext, AXViewContext, AXViewContext, AXViewContext, AXViewContext, AXViewContext) -> ()) {
  let context1 = AXContext()
  let context2 = AXContext()
  let context3 = AXContext()
  let context4 = AXContext()
  let context5 = AXContext()
  let context6 = AXContext()
  let context7 = AXContext()
  
  block(
    AXViewContext(view1, context1),
    AXViewContext(view2, context2),
    AXViewContext(view3, context3),
    AXViewContext(view4, context4),
    AXViewContext(view5, context5),
    AXViewContext(view6, context6),
    AXViewContext(view7, context7)
  )
  
  context1.installConstraints()
  context2.installConstraints()
  context3.installConstraints()
  context4.installConstraints()
  context5.installConstraints()
  context6.installConstraints()
  context7.installConstraints()
}

public func layout(view1: UIView, _ view2: UIView, _ view3: UIView, _ view4: UIView, _ view5: UIView, _ view6: UIView, _ view7: UIView, _ view8: UIView, @noescape block: (AXViewContext, AXViewContext, AXViewContext, AXViewContext, AXViewContext, AXViewContext, AXViewContext, AXViewContext) -> ()) {
  let context1 = AXContext()
  let context2 = AXContext()
  let context3 = AXContext()
  let context4 = AXContext()
  let context5 = AXContext()
  let context6 = AXContext()
  let context7 = AXContext()
  let context8 = AXContext()
  
  block(
    AXViewContext(view1, context1),
    AXViewContext(view2, context2),
    AXViewContext(view3, context3),
    AXViewContext(view4, context4),
    AXViewContext(view5, context5),
    AXViewContext(view6, context6),
    AXViewContext(view7, context7),
    AXViewContext(view8, context8)
  )
  
  context1.installConstraints()
  context2.installConstraints()
  context3.installConstraints()
  context4.installConstraints()
  context5.installConstraints()
  context6.installConstraints()
  context7.installConstraints()
  context8.installConstraints()
}
