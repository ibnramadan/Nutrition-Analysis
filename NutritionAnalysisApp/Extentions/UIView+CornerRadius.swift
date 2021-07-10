//
//  UIView+CornerRadius.swift
//  NutritionAnalysisApp
//
//  Created by iMac on 10/07/2021.
//

import UIKit

@IBDesignable
extension UIView
{
    
    @IBInspectable
    public var cornerRadius: CGFloat
    {
        set (radius) {
            self.layer.cornerRadius = radius
            self.layer.masksToBounds = radius > 0
        }
        
        get {
            return self.layer.cornerRadius
        }
    }
    
    // This function is used to round top Corner For UIView
    func roundTopCorner(cornerRadius: Double) {
           let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
           let maskLayer = CAShapeLayer()
           maskLayer.frame = self.bounds
           maskLayer.path = path.cgPath
           self.layer.mask = maskLayer
       }
    
    func roundBottomCorner(cornerRadius: Double) {
              let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
              let maskLayer = CAShapeLayer()
              maskLayer.frame = self.bounds
              maskLayer.path = path.cgPath
              self.layer.mask = maskLayer
          }
    
}

