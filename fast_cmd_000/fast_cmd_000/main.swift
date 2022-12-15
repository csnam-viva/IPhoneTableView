//
//  main.swift
//  fast_cmd_000
//
//  Created by 비바 on 2022/12/15.
//

import Foundation

//print("Hello, World!")

protocol LunchMenuSelectable{
    func selectMenu()->String
}
class Boss {
    var delegate: LunchMenuSelectable!
    
    func goLunch(){
        let menu = delegate.selectMenu()
        print("\(menu) go lunch")
    }
}
class Employee :LunchMenuSelectable{
    var menu: String
    func selectMenu() -> String {
        menu
    }
    init(menu: String) {
        self.menu = menu
    }
      
}

let boss = Boss()
let employee1 = Employee(menu: "sandwitch")
let employee2 = Employee(menu: "pizza")
boss.delegate = employee2
boss.goLunch()

