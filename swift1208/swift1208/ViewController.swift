//
//  ViewController.swift
//  swift1208
//
//  Created by 비바 on 2022/12/08.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var txtName: UITextField!
    @IBOutlet var lblHello: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        //let l = UILabel(frame: <#T##CGRect#>(x:10,y:100,width:100,height:50))
        let ulLabel = UILabel()
        ulLabel.frame = CGRect(x:50,y:100,width:100,height:50)
        ulLabel.text = "hello 2"
        ulLabel.textColor = UIColor.red
        ulLabel.backgroundColor = UIColor.blue
        view.addSubview(ulLabel)
        // Do any additional setup after loading the view.
        
    }

    @IBAction func btnSend(_ sender: UIButton) {
        lblHello.text = "Hello " + txtName.text!
        print(lblHello.text)
        lblHello.textColor=UIColor.red
        
    }
    
}

