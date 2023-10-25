//
//  ViewController + UICollectionViewExtension.swift
//  SSS_task
//
//  Created by Sunny Patel on 25/10/23.
//

import UIKit

extension CategoryHomeViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return plpViewModel.productArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductDetailCollectionCell", for: indexPath) as? ProductDetailCollectionCell else {
            return UICollectionViewCell()
        }
        cell.showData(hit: plpViewModel.productArr[indexPath.row], onIndexPath: indexPath.section)
        cell.closure = { [weak self] value in
            if value == true {
                guard let id = self!.plpViewModel.productArr[indexPath.row].productID else {return}
                cell.prouctId = id
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("product description api calling")
        guard let vc = self.storyboard?.instantiateViewController(identifier: "PDPViewController") as? PDPViewController else {return}
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width - 30)/2, height: collectionView.frame.height/2.8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.0,left: 10.0,bottom: 0.0,right: 10.0)
    }
    
}

