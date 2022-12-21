//
//  StartViewController.swift
//  TFocus
//
//  Created by 비바 on 2022/12/19.
//

import Foundation
import UIKit

class StartViewController: UIViewController{
    typealias Seconds = Int
    //var duration: Int = 0
    var duration: Seconds = 0
    @IBOutlet weak private var cancelButton: UIButton!
    @IBOutlet weak private var durationLabel:UILabel!
    @IBOutlet weak private var progressContainer: UIView!
    @IBOutlet weak private var progressWidth: NSLayoutConstraint!
    @IBOutlet weak private var imageView: UIImageView!
    var timer: Timer?
    private var start =  Date()
    
    private var remaining:  Seconds{
        duration - Int((Date().timeIntervalSince1970 - start.timeIntervalSince1970))
        //return duration
    }
    
    
    
    @IBAction private func cancel(){
        self.dismiss(animated: true,completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.progressWidth.constant  = progressContainer.frame.width
        self.cancelButton.makeRound()
        self.progressContainer.makeRound(makeToBounds: true)
        self.imageView.image = Medal(by: TimeInterval(duration/60)).icon
        print(duration)
        self.updateDuration(seconds: duration)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(tick), userInfo: nil, repeats: true)
        }
    }
    func updateDuration(seconds: Seconds){
        let minutes = seconds / 60
        let sec =  seconds % 60
        durationLabel.text = String(format: "%02d:%02d",minutes,sec)
        progressWidth.constant = CGFloat(remaining) / CGFloat(duration) * progressContainer.frame.width
    }
    @objc func tick(){
        print("tick")
        updateDuration(seconds: remaining)
    }
    
   
}
