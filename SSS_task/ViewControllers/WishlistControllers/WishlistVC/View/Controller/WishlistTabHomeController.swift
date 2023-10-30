//
//  WishlistTabHomeController.swift
//  SSS_task
//
//  Created by Sunny Patel on 27/09/23.
//

import UIKit

class WishlistTabHomeController: UIViewController {
    
    //MARK: IBOutlet
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: Variables
    var wishlistViewModel = WishlistViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "GuestWishlistBagCell", bundle: nil), forCellWithReuseIdentifier: "GuestWishlistBagCell")
        collectionView.register(UINib(nibName: "ProductDetailCollectionCell", bundle: nil), forCellWithReuseIdentifier: "ProductDetailCollectionCell")
        collectionView.register(UINib(nibName: "CollectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CollectionHeaderView")
        self.navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        wishlistViewModel.fetchData(completionHandler: {[weak self] arrayCount, wishlistArray in
            DispatchQueue.main.async {
                self?.wishlistViewModel.arrayCount = arrayCount
                self?.wishlistViewModel.wishlistArray = wishlistArray
                self?.collectionView.reloadData()
            }
        })
        collectionView.reloadData()
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
}




