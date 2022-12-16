//
//  ViewController.swift
//  TSummer
//
//  Created by 비바 on 2022/12/15.
//

import UIKit

protocol  Filter{
    var name: String {get}
    func convert(_ image:UIImage)->UIImage
}

struct SummerFilter:Filter{
    var name: String
    var identifier: String
    func convert(_ image: UIImage) -> UIImage {
        let context = CIContext(options: nil)
        let source = CIImage(image: image)
        let filter = CIFilter(name: identifier)
        
        filter?.setDefaults()
        filter?.setValue(source, forKey: kCIInputImageKey)
        
        let outputCGImage = context.createCGImage((filter?.outputImage!)!, from: (filter?.outputImage!.extent)!)
        let filteredImage = UIImage(cgImage: outputCGImage!)
        return filteredImage
    }
    
    
}
struct FilterManager{
    let list: [Filter] = [
        SummerFilter(name: "Vivid", identifier: "CIPhotoEffectChrome"),
        SummerFilter(name: "Fade", identifier: "CIPhotoEffectFade"),
        SummerFilter(name: "Instant", identifier: "CIPhotoEffectInstant"),
        SummerFilter(name: "Mono", identifier: "CIPhotoEffectMono"),
        SummerFilter(name: "Noir", identifier: "CIPhotoEffectNoir"),
        SummerFilter(name: "Process", identifier: "CIPhotoEffectProcess"),
        SummerFilter(name: "Tonal", identifier: "CIPhotoEffectTonal"),
        SummerFilter(name: "Transfer", identifier: "CIPhotoEffectTransfer"),
        SummerFilter(name: "Curve", identifier: "CILinearToSRGBToneCurve"),
        SummerFilter(name: "Linear", identifier: "CISRGBToneCurveToLinear")
    ]
}

class FiterCell : UICollectionViewCell{
    var filter: Filter!{
        didSet{
            nameLabel.text = filter.name
            imageView.image = filter.convert(UIImage(named: "photo")!)
        }
    }
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet weak private var imageView: UIImageView!
    
}
class ViewController: UIViewController  {
   private let manager = FilterManager()
    
   @IBOutlet private weak var imageView: UIImageView!
   @IBOutlet private weak var collectionView: UICollectionView!
   @IBOutlet private weak var toolbar: UIToolbar!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //self.imageView.image = nil
        self.toolbar.setShadowImage(UIImage(),forToolbarPosition: .bottom)
        self.toolbar.layer.shadowColor = UIColor.black.cgColor
        self.toolbar.layer.shadowRadius = 5
        self.toolbar.layer.shadowOpacity = 0.05
        self.toolbar.layer.shadowOffset = CGSize(width: 0, height: -10)
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }

    @IBAction func presentAlbum(){
        let controller = UIImagePickerController()
        controller.sourceType = .photoLibrary
        controller.delegate = self
        self.present(controller,animated: true,completion: nil)
        print("album")
    }
    @IBAction func presentCamera(){
        print("camera")
    }
    @IBAction func saveImage(){
        print("saveImage")
    }
}
extension ViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("did cancel")
        self.dismiss(animated: true,completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("did finish")
    }
}

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        manager.list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "FilterCell", for: indexPath) as! FiterCell
        
        let filter = manager.list[indexPath.item]
        cell.filter = filter
        
        return cell
    }
    
    
}
extension ViewController: UICollectionViewDelegate{
    
}