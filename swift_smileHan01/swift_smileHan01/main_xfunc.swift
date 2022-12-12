//
//  main.swift
//  swift_smileHan01
//
//  Created by 비바 on 2022/12/08.
//

import Foundation

func calcBMI(weight: Double, height: Double) -> String {
    
    let w = weight
    let h = height
    let bmi = w / (w * h * 0.0001)
    let shortbmi = String(format: "%.1f",bmi)
    var body = ""
    
    switch bmi {
    case 0.0 ..< 18.5:
        body = "low weight"
    case 18.5 ..< 25.0:
        body = "normal weight"
    case 25.0 ..< 50.0:
        body = "over weight"
    default :
        body = "super weight"
    }
    let retStr : String = "BIM 판정: \(shortbmi)  판정: \(body)";
    return retStr
}
//print(calcBMI(weight: 90, height: 160))

