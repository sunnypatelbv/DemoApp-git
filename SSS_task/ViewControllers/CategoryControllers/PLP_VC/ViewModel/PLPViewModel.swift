//
//  PLPViewModel.swift
//  SSS_task
//
//  Created by Sunny Patel on 25/10/23.
//

import Foundation

protocol PLPViewModelDelegate: AnyObject{
    func onSuccess()
    func onFailure(error: Error?)
}

class PLPViewModel{
    
    //MARK: Variables
    public weak var delegate: PLPViewModelDelegate?
    var productArr = [Hit]()
    var counter = 24
    
    
    func getData(){
        var components = URLComponents()
        components.scheme = "https"
        components.host = "ov-dev.sssports.com"
        components.path = "/s/UAE/dw/shop/v20_10/product_search"
        components.queryItems = [
            URLQueryItem(name: "client_id", value: "ce6abb4e-faf1-41af-94e7-feb1e2dd4a77"),
            URLQueryItem(name: "count", value: "24"),
            URLQueryItem(name: "expand", value: "prices, images, represented_products"),
            URLQueryItem(name: "locale", value: "en-AE"),
            URLQueryItem(name: "refine", value: "cgid=brands_nike"),
            URLQueryItem(name: "refine_1", value: "htype=variation_group|product"),
            URLQueryItem(name: "refine_2", value: "price=(1..)"),
            URLQueryItem(name: "refine_3", value: "orderable_only=true"),
            URLQueryItem(name: "start", value: "0")
        ]
        guard let url = components.url else {return}
        print(url)
        APIManager.shared.fetchData(pageUrl: url.absoluteString, dataModel: ProductInformationModel.self, completionHandler: {[weak self] data,response,error in
            guard let plpdata = data?.hits else {return}
            self?.productArr = plpdata
            DispatchQueue.main.async {
                self?.delegate?.onSuccess()
            }
        })
    }
    
}
