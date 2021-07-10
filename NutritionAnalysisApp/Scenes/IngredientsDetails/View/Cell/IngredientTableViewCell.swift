//
//  IngredientTableViewCell.swift
//  NutritionAnalysisApp
//
//  Created by iMac on 10/07/2021.
//

import UIKit

class IngredientTableViewCell: UITableViewCell {

    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var unitLabel: UILabel!
    @IBOutlet weak var foodLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    static let id = "IngredientCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
//
    func bindData(ingr: AnalyzeResponse, ingrStr: String){

        let stringToArr = ingrStr.split(separator: " ").compactMap({String($0)})
        if stringToArr.count > 2 {
            quantityLabel.text = stringToArr[0]
            unitLabel.text = stringToArr[1]
            foodLabel.text =  stringToArr[2]
        } else if stringToArr.count == 2 {
            quantityLabel.text = "-"
            unitLabel.text = stringToArr[0]
            foodLabel.text =  stringToArr[1]
        } else if stringToArr.count < 2 {
            quantityLabel.text = "-"
            unitLabel.text = "-"
            foodLabel.text =  stringToArr[0]
        }
        caloriesLabel.text = "\(ingr.calories ?? 0)"
        weightLabel.text = "\(ingr.totalWeight ?? 0)"
    }

}
