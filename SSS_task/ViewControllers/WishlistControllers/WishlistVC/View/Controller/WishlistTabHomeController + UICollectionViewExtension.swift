//
//  WishlistTabHomeController + UICollectionViewExtension.swift
//  SSS_task
//
//  Created by Sunny Patel on 30/10/23.
//

import UIKit

//MARK: CollectionviewDelegate and Datasource
extension WishlistTabHomeController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if wishlistViewModel.userLoggedin{
            return wishlistViewModel.arrayCount
        }
        else{
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if wishlistViewModel.userLoggedin == true{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductDetailCollectionCell", for: indexPath) as? ProductDetailCollectionCell else {
                return UICollectionViewCell()
            }
            cell.produtBrandLabel.text = wishlistViewModel.wishlistArray[indexPath.row].productID
            return cell
        }
        else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GuestWishlistBagCell", for: indexPath) as? GuestWishlistBagCell else {return UICollectionViewCell()}
            cell.label.text = "Wishlist View Controller"
            cell.imgView.image = UIImage(named: "ic_heart_grey")
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if wishlistViewModel.userLoggedin == true{
            return CGSize(width: (collectionView.frame.width - 30)/2, height: collectionView.frame.height/2.8)
        }
        else{
            return CGSize(width: collectionView.frame.width - 20 , height: collectionView.frame.height/4)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.0,left: 10.0,bottom: 0.0,right: 10.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            if let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CollectionHeaderView", for: indexPath) as? CollectionHeaderView{
                headerView.titleLabel.text = "Wishlist View Controller"
                return headerView
            }
            return UICollectionReusableView()
            
        default:
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height/12)
    }

}
