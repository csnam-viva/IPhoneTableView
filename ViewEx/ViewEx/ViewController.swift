//
//  ViewController.swift
//  ViewEx
//
//  Created by 비바 on 2022/12/12.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func goOrangeBtn(_ sender: UIButton) {
        let orangeVC = storyboard?.instantiateViewController(withIdentifier: "OrangeVC")
        //orangeVC?.modalTransitionStyle = .coverVertical
        //orangeVC?.modalTransitionStyle = .crossDissolve
        orangeVC?.modalTransitionStyle = .partialCurl
        
        present(orangeVC!,animated: true,completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

