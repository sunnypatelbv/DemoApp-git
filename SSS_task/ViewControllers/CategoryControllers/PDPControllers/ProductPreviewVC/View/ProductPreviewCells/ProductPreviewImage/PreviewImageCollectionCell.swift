//
//  PreviewImageCollectionCell.swift
//  SSS_task
//
//  Created by Sunny Patel on 03/10/23.
//

import UIKit

class PreviewImageCollectionCell: UICollectionViewCell {
    
    //MARK: IBOutlets
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    //MARK: Variables
    var imageArr:[Image] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        productImage.image = nil
        // Initialization code
        
    }
    
    //MARK: Functions
    func setupCell(image: String){
        guard let url = URL(string: image) else {return}
        DispatchQueue.global().async {
            [weak self] in
            if let data = try? Data(contentsOf: url){
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        self?.productImage.image = image
                    }
                }
            }
        }
    }

}
