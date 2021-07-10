//
//  Storyboards.swift
//  NutritionAnalysisApp
//
//  Created by iMac on 10/07/2021.
//

import Foundation

import UIKit
public enum Storyboard: String {
    case Home
    case IngredientsDetails
    case TotalFacts
    
    public func instantiate<VC: UIViewController>(_ viewController: VC.Type) -> VC {
        
        guard
            let vc = UIStoryboard(name: self.rawValue, bundle: nil)
                .instantiateViewController(withIdentifier: VC.storyboardIdentifier) as? VC
            else { fatalError("Couldn't instantiate \(VC.storyboardIdentifier) from \(self.rawValue)") }
        return vc
        
    }
    
    public func instantiateInitialViewController() -> UIViewController {
        
        guard
            let vc = UIStoryboard(name: self.rawValue, bundle: nil)
                .instantiateInitialViewController()
            else { fatalError("Couldn't instantiate initial view controller because it 's not set.") }
        return vc
        
    }
  
}

