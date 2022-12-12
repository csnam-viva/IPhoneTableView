//
//  ViewController.swift
//  ViewNaviagtor
//
//  Created by 비바 on 2022/12/12.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func btnRed(_ sender: Any) {
        guard let redVC  = storyboard?.instantiateViewController(withIdentifier: "RedVC") else { return  }
        navigationController?.pushViewController(redVC, animated: true)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

