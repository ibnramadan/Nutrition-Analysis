//
//  Nutrient.swift
//  NutritionAnalysisApp
//
//  Created by iMac on 10/07/2021.
//


import Foundation
import ObjectMapper

struct Nutrient : Mappable {

    var uri: String?
    var label: String?
    var quantity: Double?
    var unit: String?
    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        uri <- map["uri"]
        label <- map["label"]
        quantity <- map["quantity"]
        unit <- map["unit"]
  
    }

}

