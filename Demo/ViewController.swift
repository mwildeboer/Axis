//
//  ViewController.swift
//  Axis
//
//  Created by Menno Wildeboer on 15/02/16.
//  Copyright © 2016 Menno Wideboer. All rights reserved.
//

import Axis
import UIKit

class ViewController: UIViewController {
  var view1: UIView!
  var view2: UIView!
  var view3: UIView!
  var view4: UIView!
  var view5: UIView!
  var view6: UIView!
  var view7: UIView!
  var view8: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view1 = UIView(frame: CGRectZero)
    view1.backgroundColor = UIColor.redColor()
    self.view.addSubview(view1)
    
    view2 = UIView(frame: CGRectZero)
    view2.backgroundColor = UIColor.blueColor()
    self.view.addSubview(view2)

    view3 = UIView(frame: CGRectZero)
    view3.backgroundColor = UIColor.greenColor()
    self.view.addSubview(view3)
    
    view4 = UIView(frame: CGRectZero)
    view4.backgroundColor = UIColor.lightGrayColor()
    self.view.addSubview(view4)
    
    view5 = UIView(frame: CGRectZero)
    view5.backgroundColor = UIColor.orangeColor()
    self.view.addSubview(view5)
    
    view6 = UIView(frame: CGRectZero)
    view6.backgroundColor = UIColor.purpleColor()
    self.view.addSubview(view6)
    
    view7 = UIView(frame: CGRectZero)
    view7.backgroundColor = UIColor.magentaColor()
    self.view.addSubview(view7)
    
    view8 = UIView(frame: CGRectZero)
    view8.backgroundColor = UIColor.brownColor()
    self.view.addSubview(view8)
  }
  
  override func viewDidLayoutSubviews() {
    layout(view1, view2, view3, view4, view5, view6, view7, view8) { (view1, view2, view3, view4, view5, view6, view7, view8) in
      view1.left == 20
      view1.top == 100
      view1.width == 100
      view1.height == 100
      
      view2.left == view1.right + 10
      view2.top == view1.top
      view2.width == view1.width
      view2.height == view1.height
      
      view3.left == view1.left
      view3.top == view1.bottom + 10
      view3.right == view2.right
      view3.height == view1.height
      
      view4.top == view3.bottom + 10
      view4.centerX == view1.centerX
      view4.width == view1.width - 40
      view4.height == view1.height * 2

      view5.centerX == view4.centerX
      view5.centerY == view4.centerY - 35
      view5.width == view1.width
      view5.height == view1.height / 2

      view6.centerX == view4.centerX
      view6.centerY == view4.centerY + 35
      view6.width == view5.width
      view6.height == view5.height
      
      view7.left == view2.right + 10
      view7.top == view1.top
      view7.bottom == view4.bottom
      view7.width == view4.width * 2
      
      view8.left == view5.right + 10
      view8.right == view7.left - 10
      view8.top == view4.top
      view8.height == view4.height
    }
  }
}

