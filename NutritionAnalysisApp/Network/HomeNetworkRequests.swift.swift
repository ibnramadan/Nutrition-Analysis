//
//  HomeNetworkRequests.swift.swift
//  NutritionAnalysisApp
//
//  Created by iMac on 10/07/2021.
//

import Foundation
import ObjectMapper
import Alamofire

protocol HomeNetworkRequests {
    func analyze( ingr: String, completionHandler: @escaping (AFResult<AnalyzeResponse?>) -> Void)
    func getFacts( ingr: [String], completionHandler: @escaping (AFResult<Facts?>) -> Void)


}

class HomeNetworkRequestsImplementation: HomeNetworkRequests {
    
    func analyze( ingr: String, completionHandler: @escaping (AFResult<AnalyzeResponse?>) -> Void) {
        let request = AuthenticationRouter.analyze(ingr: ingr)
        AF.request(request).responseJSON { response in
            switch response.result {
            case let .success(value):
                let response = Mapper<AnalyzeResponse>().map(JSON: value as! [String:Any])
                completionHandler(.success(response))
            case let .failure(error):
                completionHandler(.failure(error))
            }
        }
        
    }
    func getFacts( ingr: [String], completionHandler: @escaping (AFResult<Facts?>) -> Void) {
        let request = AuthenticationRouter.getFacts(ingr: ingr)
        AF.request(request).responseJSON { response in
            switch response.result {
            case let .success(value):
                let response = Mapper<Facts>().map(JSON: value as! [String:Any])
                completionHandler(.success(response))
            case let .failure(error):
                completionHandler(.failure(error))
            }
        }
        
    }

    
}

