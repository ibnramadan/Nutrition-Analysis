//
//  TotalFactsViewController.swift
//  NutritionAnalysisApp
//
//  Created by iMac on 11/07/2021.
//

import UIKit
import RxSwift
import RxCocoa

class TotalFactsViewController: UIViewController {

    @IBOutlet weak var CaloriesLabel: UILabel!
    @IBOutlet weak var FatLabel: UILabel!
    @IBOutlet weak var CholesterolLabel: UILabel!
    @IBOutlet weak var SodiumLabel: UILabel!
    @IBOutlet weak var CarbohydrateLabel: UILabel!
    @IBOutlet weak var ProteinLabel: UILabel!
    @IBOutlet weak var VitaminLabel: UILabel!
    @IBOutlet weak var CalciumLabel: UILabel!
    @IBOutlet weak var IronLabel: UILabel!
    @IBOutlet weak var PotassiumLabel: UILabel!
    
    var ingredients: [String]?
  
    let totalFactsViewModel = TotalFactsViewModel()
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = ""
        subscribeToLoading()
        subscribeToResponse()
        getFacts()
        
    }
    func subscribeToLoading() {
        totalFactsViewModel.loadingBehavior.subscribe(onNext: { (isLoading) in
            if isLoading {
                self.showIndicator()
            } else {
                self.hideIndicator()
            }
        }).disposed(by: disposeBag)
    }
    func subscribeToResponse() {
  
        self.totalFactsViewModel.AnalyzeResponseObservable.subscribe(onNext: {
            self.bindData(data : $0)
            
        }).disposed(by: disposeBag)
    }

    func getFacts() {
        totalFactsViewModel.getFacts(ingr: ingredients ?? [])
    }

    func  bindData(data : Facts){
        CaloriesLabel.text = "\(data.calories ?? 0)"
        FatLabel.text = "\(data.totalNutrients?.fAT?.quantity ?? 0.0) \(data.totalNutrients?.fAT?.unit ?? "")"
        CholesterolLabel.text = "\(data.totalNutrients?.fAT?.quantity ?? 0.0) \(data.totalNutrients?.fAT?.unit ?? "")"
        SodiumLabel.text = "\(data.totalNutrients?.cHOLE?.quantity ?? 0.0) \(data.totalNutrients?.cHOLE?.unit ?? "")"
        CarbohydrateLabel.text = "\(data.totalNutrients?.cHOCDF?.quantity ?? 0.0) \(data.totalNutrients?.cHOCDF?.unit ?? "")"
        ProteinLabel.text = "\(data.totalNutrients?.pROCNT?.quantity ?? 0.0) \(data.totalNutrients?.pROCNT?.unit ?? "")"
        VitaminLabel.text = "\(data.totalNutrients?.vITC?.quantity ?? 0.0) \(data.totalNutrients?.vITC?.unit ?? "")"
        CalciumLabel.text = "\(data.totalNutrients?.cA?.quantity ?? 0.0) \(data.totalNutrients?.cA?.unit ?? "")"
        IronLabel.text = "\(data.totalNutrients?.fE?.quantity ?? 0.0) \(data.totalNutrients?.fE?.unit ?? "")"
        PotassiumLabel.text = "\(data.totalNutrients?.k?.quantity ?? 0.0) \(data.totalNutrients?.k?.unit ?? "")"
    }
 
}
