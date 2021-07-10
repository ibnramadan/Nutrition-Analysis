//
//  NetworkConstants.swift
//  NutritionAnalysisApp
//
//  Created by iMac on 10/07/2021.
//

import Foundation

enum NetworkConstants {
    static var generalAppHeaders : [String : String] {
        return [
            "Accept" : "application/json"]
    }
    static var baseUrl = "https://api.edamam.com/api/"

    enum EndPoints {
        static let analyze = baseUrl + "nutrition-data"
        static let data = baseUrl + "nutrition-details"

        
    }
}

