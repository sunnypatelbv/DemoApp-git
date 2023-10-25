//
//  ProductColourCell.swift
//  SSS_task
//
//  Created by Sunny Patel on 03/10/23.
//

import UIKit

class ProductColourCell: UITableViewCell {
    
    //MARK: IBOutlet
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: Variables
    var issmallArr = true
    var smallArr = ["4","4.5","5","5.5","More"]
    var colourCount = 0
    var colourDataArr : [ImageGroup] = []
    var closure: ((Int) -> ())?
    

    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(UINib(nibName: "ColourPreviewCell", bundle: nil), forCellWithReuseIdentifier: "ColourPreviewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
      
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

//MARK: CollectionViewDelegates and CollectionViewDataSourtce
extension ProductColourCell: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return colourCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColourPreviewCell", for: indexPath) as? ColourPreviewCell else {return UICollectionViewCell()}
        
        if let productImage = colourDataArr[indexPath.row].images?[0].link{
            cell.colourImage.image = nil
            guard let url = URL(string: productImage) else {return UICollectionViewCell()}
            DispatchQueue.global().async {
                [weak self] in
                if let data = try? Data(contentsOf: url){
                    if let image = UIImage(data: data){
                        DispatchQueue.main.async {
                            cell.colourImage.image = image
                        }
                    }
                }
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 90)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        closure?(indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.0,left: 5.0,bottom: 0.0,right: 5.0)
    }
    
}
