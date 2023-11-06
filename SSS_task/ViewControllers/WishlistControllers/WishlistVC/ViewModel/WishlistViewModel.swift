//
//  WishlistViewModel.swift
//  SSS_task
//
//  Created by Sunny Patel on 30/10/23.
//

import Foundation

protocol WishlistViewModelDelegate: AnyObject{
    func onSuccess()
    func onFailure(error: Error?)
}

class WishlistViewModel{
    
    //MARK: Variables
    public weak var delegate: WishlistViewModelDelegate?
    var arrayCount = 0
    var wishlistArray : [CustomerProductListItem] = []
    var userLoggedin: Bool {
        UserDefaults.standard.bool(forKey: "isUserLoggedInUserDefault")
    }
    var numberOfItemsWishlist = 0
    
    
    
    func fetchData(completionHandler: @escaping (Int, [CustomerProductListItem]) -> ()){
        var components = URLComponents()
        components.scheme = "https"
        components.host = "ov-dev.sssports.com"
        components.path = "/s/UAE/dw/shop/v20_10/customers/bcbpcY1HgG9oyITnupOjaFha8w/product_lists"
        guard let url = components.url else {return}
        let token = UserDefaults.standard.string(forKey: "authToken")
        let header = [
            "Authorization": token!
        ]
        APIManager.shared.fetchData(pageUrl: url.absoluteString, httpHeaders: header, dataModel: WishlistModel.self) { (data,response, error) in
            guard let wishlistData = data else {return}
            
            if let counter = (wishlistData.data?[0].customerProductListItems!.count), let wishlist = wishlistData.data?[0].customerProductListItems{
                self.delegate?.onSuccess()
                completionHandler(counter,wishlist)
            } else {
                self.delegate?.onFailure(error: error)
            }
        }
    }
}
