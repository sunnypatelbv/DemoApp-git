//
//  ProductPreviewTableCell.swift
//  SSS_task
//
//  Created by Sunny Patel on 03/10/23.
//

import UIKit

class ProductPreviewTableCell: UITableViewCell {
    
    //MARK: IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: Variables
    var imageCount = 0
    var previewImageData : [Image] = []
    var currentImageUrl : URL?
    var closure: ((Bool, URL) -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "PreviewImageCollectionCell", bundle: nil), forCellWithReuseIdentifier: "PreviewImageCollectionCell")
        print(previewImageData)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

//MARK: UICollectionView Delegates and DataSource
extension ProductPreviewTableCell: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PreviewImageCollectionCell", for: indexPath) as? PreviewImageCollectionCell else {return UICollectionViewCell()}
        if let productImage = previewImageData[indexPath.row].link{
            cell.productImage.image = nil
            cell.pageControl.numberOfPages = imageCount
            guard let url = URL(string: productImage) else {return UICollectionViewCell()}
            currentImageUrl = url
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        closure?(true, currentImageUrl!)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 325)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PreviewImageCollectionCell", for: indexPath) as? PreviewImageCollectionCell else {return}
        print(indexPath)
    }
    

    
   
}
