//
//  HomeViewController.swift
//  NutritionAnalysisApp
//
//  Created by iMac on 10/07/2021.
//

import UIKit
import RxCocoa
import RxSwift

class HomeViewController: UIViewController {

    
    @IBOutlet weak var ingredientTextView: UITextView!
    @IBOutlet weak var analyseBtn: UIButton!
    
    let homeViewModel = HomeViewModel()
    //handle memory manual
    let disposeBag = DisposeBag()
    
    let ingredientTextViewPlaceholder = "For example:\n1 cup rice\n"
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        bindTextViewToViewModel()
        subscribeIsAnalyseBtnEnabled()
        subscribeToAnalyseBtn()
        subscripeToGetIngredients()
        setupUI()
    }
    
    func  bindTextViewToViewModel(){
        ingredientTextView.rx.text.orEmpty.bind(to: homeViewModel.ingredientsTextViewBehavior).disposed(by: disposeBag)
    }

    func subscribeIsAnalyseBtnEnabled() {
        homeViewModel.isAnalyzeButtonEnapled.bind(to: analyseBtn.rx.isEnabled).disposed(by: disposeBag)
    }
    func subscribeToAnalyseBtn() {
        analyseBtn.rx.tap
            .throttle(RxTimeInterval.milliseconds(500), scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self](_) in
                guard let self = self else { return }
                self.homeViewModel.getIngredients()
        }).disposed(by: disposeBag)
        
    }

    func subscripeToGetIngredients(){
        homeViewModel.IngredientsSubjectObservable.subscribe(onNext: {
            if !$0.isEmpty {
                let vc = Storyboard.IngredientsDetails.instantiate(IngredientsDetailsViewController.self)
                vc.ingredients = $0
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }).disposed(by: disposeBag)
    }
  

}
extension HomeViewController {
    
    private func setupUI(){
        ingredientTextView.sizeToFit()
        ingredientTextView.isScrollEnabled = false
        setPlaceholderTorecipeTextView(placeholder: ingredientTextViewPlaceholder)
        ingredientTextViewActions(placeholder: ingredientTextViewPlaceholder)
    }
    
 
    private func ingredientTextViewActions(placeholder: String){
        ingredientTextView.rx.didBeginEditing.bind { (_) in
            if self.ingredientTextView.textColor == UIColor.lightGray {
                self.ingredientTextView.text = ""
                self.ingredientTextView.textColor = UIColor.black
            }
        }.disposed(by: disposeBag)
        
        ingredientTextView.rx.didEndEditing.bind { (_) in
            self.setPlaceholderTorecipeTextView(placeholder: placeholder)
        }.disposed(by: disposeBag)
        
        ingredientTextView.rx.didChange.bind { (_) in
            
        }.disposed(by: disposeBag)
    }
    
    private func setPlaceholderTorecipeTextView(placeholder: String){
        if self.ingredientTextView.text.isEmpty {
            self.ingredientTextView.text = placeholder
            self.ingredientTextView.textColor = UIColor.lightGray
        }
    }
}
