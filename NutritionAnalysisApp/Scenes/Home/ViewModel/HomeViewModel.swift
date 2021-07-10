//
//  HomeViewModel.swift
//  NutritionAnalysisApp
//
//  Created by iMac on 10/07/2021.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire

class HomeViewModel {
    
    var ingredientsTextViewBehavior = BehaviorRelay<String>(value : "")
    var loadingBehavior = BehaviorRelay<Bool>(value: false)
    
    private var IngredientsSubject = PublishSubject<[String]>()
    var IngredientsSubjectObservable: Observable<[String]> {
        return IngredientsSubject
    }
    
    var ingredientsTextViewValid : Observable<Bool> {
        ingredientsTextViewBehavior.asObservable().map { ingredientsText -> Bool in
            return ingredientsText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        }
    }

    var isAnalyzeButtonEnapled: Observable<Bool> {
        ingredientsTextViewBehavior.asObservable().map { ingredientsText -> Bool in
            return !ingredientsText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty && ingredientsText != "For example:\n1 cup rice\n"
        }
    }
    
    
    func getIngredients() {

            let ingredients =  ingredientsTextViewBehavior.value.split(separator: "\n").compactMap({String($0)})
            self.IngredientsSubject.onNext(ingredients)
        }
       
  
}

