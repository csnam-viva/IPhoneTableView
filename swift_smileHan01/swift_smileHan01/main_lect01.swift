//
//  main.swift
//  swift_smileHan01
//
//  Created by 비바 on 2022/12/08.
//

import Foundation

func lesson() {
    let w = 190.0
    let h = 170.0
    let bmi = w / (w * h * 0.0001)
    let shortbmi = String(format: "%.1f",bmi)
    var body = ""
    
    print(shortbmi)
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
    
    print("BIM 판정: \(shortbmi)  판정: \(body)")
    
}






