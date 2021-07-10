//
//  dic.swift
//  NutritionAnalysisApp
//
//  Created by iMac on 10/07/2021.
//

extension Dictionary {
    var queryString: String {
        var output: String = ""
        forEach({ output += "\($0.key)=\($0.value)&" })
        output = String(output.dropLast())
        return output
    }
}
