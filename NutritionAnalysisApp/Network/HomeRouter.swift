//
//  HomeRouter.swift
//  NutritionAnalysisApp
//
//  Created by iMac on 10/07/2021.
//


import Foundation
import Alamofire

enum AuthenticationRouter: URLRequestConvertible {
    
    case analyze( ingr: String)
    case getFacts( ingr: [String])
    
    func asURLRequest() throws -> URLRequest {
        var method: HTTPMethod {
            switch  self {
            case .analyze:
                return .get
            case .getFacts:
                return .post
                
            }
        }
        
        let params: ([String: Any]?) = {
            switch self {
            case  .analyze:
                return nil
            case let .getFacts(ingr):
                return ["ingr" : ingr]
            }
        }()
        
        let custonHeaders: ([String: String]?) = {
            switch self {
            case .analyze:
                return nil
            case .getFacts:
                return nil
                
            }
        }()
        
        let headers = NetworkConstants.generalAppHeaders.merging(custonHeaders ?? [:]) { (_, k2) -> String in
            return k2
        }
        // ?app_id=495b297e&
        let url: URL = {
            switch self {
            case let .analyze(ingr):
                let ing = ingr.replacingOccurrences(of: " ", with: "%20")
                let query =  [ "app_id" : "495b297e" , "app_key" : "10c5ff064f52654dd969438b7837d7fc" , "ingr" : ing].queryString
                
                return URL(string: NetworkConstants.EndPoints.analyze + "?"  + query)!
            case .getFacts:
                let query =  [ "app_id" : "495b297e" , "app_key" : "10c5ff064f52654dd969438b7837d7fc"].queryString
                return URL(string: NetworkConstants.EndPoints.data + "?"  + query)!
            }
        }()
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        urlRequest.allHTTPHeaderFields = headers
        
        let encoding: ParameterEncoding = {
            return JSONEncoding.default
        }()
        
        return try! encoding.encode(urlRequest, with: params)
    }
    
    
}

