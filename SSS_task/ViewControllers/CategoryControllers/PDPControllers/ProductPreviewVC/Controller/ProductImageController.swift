//
//  ProductImageController.swift
//  SSS_task
//
//  Created by Sunny Patel on 06/10/23.
//

import UIKit

class ProductImageController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: Variables
    var imageURL: URL?
    var imageDataArr:[Image] = []
    var url = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "PreviewImageCollectionCell", bundle: nil), forCellWithReuseIdentifier: "PreviewImageCollectionCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
    

 

}

extension ProductImageController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageDataArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PreviewImageCollectionCell", for: indexPath) as? PreviewImageCollectionCell else {return UICollectionViewCell()}
        if let productImage = imageDataArr[indexPath.row].link{
            cell.productImage.image = nil
            guard let url = URL(string: productImage) else {return UICollectionViewCell()}
            imageURL = url
            DispatchQueue.global().async {
                [weak self] in
                if let data = try? Data(contentsOf: url){
                    if let image = UIImage(data: data){
                        DispatchQueue.main.async {
                            cell.productImage.image = image
                        }
                    }
                }
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
}
