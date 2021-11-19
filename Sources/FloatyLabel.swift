//
//  FloatyLabel.swift
//  Floaty
//
//  Created by Géza Mikló on 2021. 11. 19..
//  Copyright © 2021. Lee Sun-Hyoup. All rights reserved.
//

import Foundation

open class FloatyLabel: UILabel {
  
  @IBInspectable var insetX: CGFloat = 0 {
     didSet {
       setNeedsLayout()
     }
  }
  
  @IBInspectable var insetY: CGFloat = 0 {
     didSet {
         setNeedsLayout()
     }
  }

  
  public override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
      return super.textRect(forBounds: bounds, limitedToNumberOfLines: numberOfLines).inset(by: UIEdgeInsets(top: -insetY, left: -insetX, bottom: -insetY, right: -insetX))
  }

  public override func drawText(in rect: CGRect) {
      let insets = UIEdgeInsets.init(top: insetY, left: insetX, bottom: insetY, right: insetX)
      super.drawText(in: rect.inset(by: insets))
  }
  
  public override var intrinsicContentSize: CGSize {
      let size = super.intrinsicContentSize
      return CGSize(width: size.width + insetX + insetX,
                    height: size.height + insetY + insetY)
  }
}
