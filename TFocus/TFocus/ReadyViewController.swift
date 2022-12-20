//
//  ViewController.swift
//  TFocus
//
//  Created by 비바 on 2022/12/19.
//

import UIKit

extension Medal{
    init(by duration: TimeInterval) {
        if duration < 30{
            self = .bronze
        }
        else if 20 <= duration && duration < 50{
            self = .silver
        }
        else{
            self = .gold
        }
    }
    var icon: UIImage{
        switch self {
        case .gold:
            return UIImage(named: "gold")!
        case .silver:
            return UIImage(named: "silver")!
        case .bronze:
            return UIImage(named: "bronze")!
        }
        
    }
    var color: UIColor{
        switch self {
        case .gold:
            return UIColor(red: 255/255, green: 208/255, blue: 81/255, alpha: 1)
        case .silver:
            return UIColor(red: 177/255, green: 161/255, blue: 182/255, alpha: 1)
        case .bronze:
            return UIColor(red: 225/255, green: 179/255, blue: 178/255, alpha: 1)
        }
    }
}
extension UIView{
    func makeRound(makeToBounds: Bool = false){
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.cornerCurve = .continuous
        self.layer.masksToBounds = makeToBounds
    }
}
extension UIView {
    func addShadow(with color:UIColor){
        self.layer.shadowOpacity = 0.5
        self.layer.shadowColor = color.cgColor
        self.layer.shadowRadius = 5
    }
    
}
class ReadyViewController: UIViewController {
    @IBOutlet private weak var startButton: UIButton!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var slider:  UISlider!
    private let range: (from: Float,to: Float) = (from: 20, to: 60)
    private var currentMedal = Medal.bronze
    override func viewDidLoad() {
        super.viewDidLoad()
        slider.minimumValue = range.from
        slider.maximumValue = range.to
        self.durationChange()
        // Do any additional setup after loading the view.
        startButton.makeRound()
        
    }
    @IBAction func presentMedalist(){
        print("medal list")
    }
    @IBAction func start(){
        performSegue(withIdentifier: "start", sender: nil)
        //print("start")
    }
    @IBAction func durationChange(){
        let medal = Medal(by: TimeInterval(slider.value))
        durationLabel.text = "\(Int(slider.value)) Minute"
        startButton.backgroundColor = medal.color
        startButton.addShadow(with: currentMedal.color)
        imageView.image = medal.icon
        slider.tintColor = medal.color
                
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let identifier = segue.identifier
        if identifier == "start" {
            let controller = segue.destination as! StartViewController
            controller.duration = Int( slider.value) * 60
        }
    }


}

