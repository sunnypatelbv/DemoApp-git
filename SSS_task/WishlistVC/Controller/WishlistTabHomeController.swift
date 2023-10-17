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
    var arrayCount = 0
    var wishlistArray : [CustomerProductListItem] = []
    var userLoggedin: Bool {
        UserDefaults.standard.bool(forKey: "isUserLoggedInUserDefault")
    }
    var numberOfItemsWishlist = 0
    
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
        fetchData(completionHandler: {[weak self] arrayCount, wishlistArray in
            DispatchQueue.main.async {
                self?.arrayCount = arrayCount
                self?.wishlistArray = wishlistArray
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
    
    func fetchData(completionHandler: @escaping (Int, [CustomerProductListItem]) -> ()){
        guard let url = URL(string: "https://ov-dev.sssports.com/s/UAE/dw/shop/v20_10/customers/bcbpcY1HgG9oyITnupOjaFha8w/product_lists") else {return}
        var request = URLRequest(url: url)
        guard let token = UserDefaults.standard.object(forKey: "authToken") else {return}
//        print(token)
        request.setValue("\(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                return
            }
            do {
                let wishlistData = try JSONDecoder().decode(WishlistModel.self, from: data)
                if let counter = (wishlistData.data?[0].customerProductListItems!.count), let wishlist = wishlistData.data?[0].customerProductListItems{
                    completionHandler(counter,wishlist)
                }
            }
            catch {
                print(error.localizedDescription)
            }        }
        task.resume()
    }
}

//MARK: CollectionviewDelegate and Datasource
extension WishlistTabHomeController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if userLoggedin{
            print(arrayCount)
            return arrayCount
        }
        else{
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if userLoggedin == true{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductDetailCollectionCell", for: indexPath) as? ProductDetailCollectionCell else {
                return UICollectionViewCell()
            }
            cell.produtBrandLabel.text = wishlistArray[indexPath.row].productID
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
        if userLoggedin == true{
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


