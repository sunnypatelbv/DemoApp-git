//
//  WishlistViewModel.swift
//  SSS_task
//
//  Created by Sunny Patel on 30/10/23.
//

import Foundation

class WishlistViewModel{
    
    //MARK: Variables
    var arrayCount = 0
    var wishlistArray : [CustomerProductListItem] = []
    var userLoggedin: Bool {
        UserDefaults.standard.bool(forKey: "isUserLoggedInUserDefault")
    }
    var numberOfItemsWishlist = 0
    
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
