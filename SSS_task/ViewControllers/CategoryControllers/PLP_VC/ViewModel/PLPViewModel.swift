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
    let url =  "https://ov-dev.sssports.com/s/UAE/dw/shop/v20_10/product_search?client_id=ce6abb4e-faf1-41af-94e7-feb1e2dd4a77&count=24&expand=prices,%20images,%20represented_products&locale=en-AE&refine=cgid%3Dbrands_nike&refine_1=htype%3Dvariation_group%7Cproduct&refine_2=price%3D(1..)&refine_3=orderable_only%3Dtrue&start=0"
    
    func getData(){
        APIManager.shared.fetchData(pageUrl: url, dataModel: ProductInformationModel.self, completionHandler: {[weak self] data,error in
            if let data = data {
                self?.productArr = (data.hits)!
                DispatchQueue.main.async {
                    self?.delegate?.onSuccess()
                }
            } else {
                self?.delegate?.onFailure(error: error)
            }
            
        })

    }

}
