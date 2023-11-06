//
//  ProductImageController + UICollectionViewExtension.swift
//  SSS_task
//
//  Created by Sunny Patel on 30/10/23.
//

import UIKit

extension ProductImageController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productImageViewModel.imageDataArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PreviewImageCollectionCell", for: indexPath) as? PreviewImageCollectionCell else {return UICollectionViewCell()}
        if let productImage = productImageViewModel.imageDataArr[indexPath.row].link{
            cell.setupCell(image: productImage)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: collectionView.frame.height)
    }
    
}

