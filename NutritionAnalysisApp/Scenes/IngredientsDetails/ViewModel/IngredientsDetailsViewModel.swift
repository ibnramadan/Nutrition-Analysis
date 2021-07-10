//
//  IngredientsDetailsViewModel.swift
//  NutritionAnalysisApp
//
//  Created by iMac on 10/07/2021.
//


import Foundation
import RxSwift
import RxCocoa
import Alamofire

class IngredientsDetailsViewModel {
    
    var loadingBehavior = BehaviorRelay<Bool>(value: false)
    private let networkInstance: HomeNetworkRequests = HomeNetworkRequestsImplementation()
    
    private var isTableHidden = BehaviorRelay<Bool>(value: false)
    
    private var AnalyzeResponseSubject = PublishSubject<[AnalyzeResponse]>()
    var AnalyzeResponseObservable: Observable<[AnalyzeResponse]> {
        return AnalyzeResponseSubject
    }

    var isTableHiddenObservable: Observable<Bool> {
        return isTableHidden.asObservable()
    }
    
     func Analyze(ingr: [String]) {
       
        var array = Array<AnalyzeResponse>()
        loadingBehavior.accept(true)
        for i in ingr {
        networkInstance.analyze(ingr: i) { [weak self] (response) in
                guard let self = self else { return }
            self.loadingBehavior.accept(false)
                switch response {
                case let .success(result) where (result != nil) :
                    array.append(result!)
                    print(array)
                    self.AnalyzeResponseSubject.onNext(array)
                case .success(_):
                    print("Server Error")
                    self.isTableHidden.accept(true)
                case let .failure(error) :
                    print(error.localizedDescription)
                    self.isTableHidden.accept(true)
                }
            }
        }
        

      
     }
}


