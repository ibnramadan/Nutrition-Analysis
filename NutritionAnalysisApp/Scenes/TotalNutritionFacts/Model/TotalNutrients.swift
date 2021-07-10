/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
import ObjectMapper

struct TotalNutrients : Mappable {
	var eNERC_KCAL : nut?
	var fAT : nut?
	var fASAT : nut?
	var fAMS : nut?
	var fAPU : nut?
	var cHOCDF : nut?
	var pROCNT : nut?
	var cHOLE : nut?
	var nA : nut?
	var cA : nut?
	var mG : nut?
	var k : nut?
	var fE : nut?
	var zN : nut?
	var p : nut?
	var vITC : nut?
	var tHIA : nut?
	var rIBF : nut?
	var nIA : nut?
	var vITB6A : nut?
	var fOLDFE : nut?
	var fOLFD : nut?
	var fOLAC : nut?
	var vITB12 : nut?
	var vITD : nut?
	var wATER : nut?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		eNERC_KCAL <- map["ENERC_KCAL"]
		fAT <- map["FAT"]
		fASAT <- map["FASAT"]
		fAMS <- map["FAMS"]
		fAPU <- map["FAPU"]
		cHOCDF <- map["CHOCDF"]
		pROCNT <- map["PROCNT"]
		cHOLE <- map["CHOLE"]
		nA <- map["NA"]
		cA <- map["CA"]
		mG <- map["MG"]
		k <- map["K"]
		fE <- map["FE"]
		zN <- map["ZN"]
		p <- map["P"]
		vITC <- map["VITC"]
		tHIA <- map["THIA"]
		rIBF <- map["RIBF"]
		nIA <- map["NIA"]
		vITB6A <- map["VITB6A"]
		fOLDFE <- map["FOLDFE"]
		fOLFD <- map["FOLFD"]
		fOLAC <- map["FOLAC"]
		vITB12 <- map["VITB12"]
		vITD <- map["VITD"]
		wATER <- map["WATER"]
	}

}
