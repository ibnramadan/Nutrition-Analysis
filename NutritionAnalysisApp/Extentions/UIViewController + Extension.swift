//
//  UIViewController.swift
//  NutritionAnalysisApp
//
//  Created by iMac on 10/07/2021.
//

import Foundation
import UIKit
import MBProgressHUD
import Toast_Swift


extension UIViewController {
 
    public static var storyboardIdentifier: String {
           return self.description().components(separatedBy: ".").dropFirst().joined(separator: ".")
    }
    
    func showIndicator() {
        let indicator = MBProgressHUD.showAdded(to: self.view, animated: true)
        indicator.label.text = ""
        indicator.isUserInteractionEnabled = false
        indicator.detailsLabel.text = ""
        indicator.show(animated: true)
        self.view.isUserInteractionEnabled = false
    }
    func hideIndicator() {
        MBProgressHUD.hide(for: self.view, animated: true)
        self.view.isUserInteractionEnabled = true
    }
    
    func showHint(message: String) {
        self.view.makeToast(message, duration: 3.0, position: .bottom)
    }
}

