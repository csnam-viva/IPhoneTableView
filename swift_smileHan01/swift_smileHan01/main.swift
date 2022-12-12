//
//  main.swift
//  swift_smileHan01
//
//  Created by 비바 on 2022/12/08.
//

import Foundation

func Lesson01(){
    var x : String? = "Hi"
    print(x, x!)
    
    if let a = x {
        print(a)
    }
    let b = x!.count
    print(type(of:b),b)
    let b1 = x?.count
    print(type(of:b1),b1,b1!)
    
    let c = x ?? ""
    print(type(of:c),c)
    
}
Lesson01()
