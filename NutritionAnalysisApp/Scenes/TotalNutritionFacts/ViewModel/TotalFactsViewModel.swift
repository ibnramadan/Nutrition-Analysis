//
//  TotalFactsViewModel.swift
//  NutritionAnalysisApp
//
//  Created by iMac on 11/07/2021.
//


import Foundation
import RxSwift
import RxCocoa
import Alamofire

class TotalFactsViewModel {
    
    var loadingBehavior = BehaviorRelay<Bool>(value: false)
    private let networkInstance: HomeNetworkRequests = HomeNetworkRequestsImplementation()
    

    
    private var AnalyzeResponseSubject = PublishSubject<Facts>()
    var AnalyzeResponseObservable: Observable<Facts> {
        return AnalyzeResponseSubject
    }

 
     func getFacts(ingr: [String]) {
       

        loadingBehavior.accept(true)
        networkInstance.getFacts(ingr: ingr) { [weak self] (response) in
                guard let self = self else { return }
            self.loadingBehavior.accept(false)
                switch response {
                case let .success(result) where (result != nil) :
                    self.AnalyzeResponseSubject.onNext(result!)
                case .success(_):
                    print("Server Error")
                case let .failure(error) :
                    print(error.localizedDescription)
                }
            }
        

     }
}



