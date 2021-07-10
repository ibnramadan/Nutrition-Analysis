//
//  IngredientsDetailsViewController.swift
//  NutritionAnalysisApp
//
//  Created by iMac on 10/07/2021.
//

import UIKit
import RxSwift
import RxCocoa

class IngredientsDetailsViewController: UIViewController {

    @IBOutlet weak var ingredientsTableView: UITableView!
    @IBOutlet weak var ingredientsContainerView: UIView!
    @IBOutlet weak var showTotalFactsBtn: UIButton!
    let ingredientsTableViewCell = "IngredientTableViewCell"
    let ingredientsDetailsViewModel = IngredientsDetailsViewModel()
    let disposeBag = DisposeBag()
    var ingredients: [String]?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        bindToHiddenTable()
        subscribeToLoading()
        subscribeToResponse()
        getIngredients()
        subscribeToTotalFactsBtn() 
        
    }
    func setupTableView() {
        ingredientsTableView.register(UINib(nibName: ingredientsTableViewCell, bundle: nil), forCellReuseIdentifier: ingredientsTableViewCell)
    }
    func bindToHiddenTable() {
        ingredientsDetailsViewModel.isTableHiddenObservable.bind(to: self.ingredientsContainerView.rx.isHidden).disposed(by: disposeBag)
    }
    func subscribeToLoading() {
        ingredientsDetailsViewModel.loadingBehavior.subscribe(onNext: { (isLoading) in
            if isLoading {
                self.showIndicator()
            } else {
                self.hideIndicator()
            }
        }).disposed(by: disposeBag)
    }
    func subscribeToResponse() {
        self.ingredientsDetailsViewModel.AnalyzeResponseObservable
            .bind(to: self.ingredientsTableView.rx.items(cellIdentifier: ingredientsTableViewCell,
                       cellType: IngredientTableViewCell.self)) { row, Data, cell in
                        print(row)
                cell.bindData(ingr: Data, ingrStr: self.ingredients?[row] ?? "")
        }.disposed(by: disposeBag)
    }

    func getIngredients() {
        ingredientsDetailsViewModel.Analyze(ingr: ingredients ?? [])
    }
    
    func subscribeToTotalFactsBtn() {
        showTotalFactsBtn.rx.tap
            .throttle(RxTimeInterval.milliseconds(500), scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self](_) in
                guard let self = self else { return }
                let vc = Storyboard.TotalFacts.instantiate(TotalFactsViewController.self)
                vc.ingredients = self.ingredients
                self.navigationController?.pushViewController(vc, animated: true)
        }).disposed(by: disposeBag)
        
    }

}
