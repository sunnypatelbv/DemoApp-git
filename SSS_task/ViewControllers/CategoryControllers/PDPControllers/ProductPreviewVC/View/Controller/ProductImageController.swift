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
    var productImageViewModel = ProductPreviewViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "PreviewImageCollectionCell", bundle: nil), forCellWithReuseIdentifier: "PreviewImageCollectionCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
}

