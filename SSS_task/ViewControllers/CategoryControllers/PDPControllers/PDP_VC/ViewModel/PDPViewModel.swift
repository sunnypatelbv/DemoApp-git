//
//  PDPViewModel.swift
//  SSS_task
//
//  Created by Sunny Patel on 25/10/23.
//

import Foundation

protocol PDPViewModelDelegate: AnyObject{
    func onSuccess()
    func onFailure(error: Error?)
}

class PDPViewModel{
    
    //MARK: Variables
    var descriptionArr = [
        ProductDescriptionDesignModel(isPreviewProductImage: true, isColourOption: false, isProductDetail: false, isOffer: false, isSize: false, identifier: .previewImage),
        ProductDescriptionDesignModel(isPreviewProductImage: false, isColourOption: true, isProductDetail: false, isOffer: false, isSize: false, identifier: .colourOption),
        ProductDescriptionDesignModel(isPreviewProductImage: false, isColourOption: false, isProductDetail: true, isOffer: false, isSize: false, identifier: .productDetail),
        ProductDescriptionDesignModel(isPreviewProductImage: false, isColourOption: false, isProductDetail: true, isOffer: false, isSize: true, identifier: .sizeOption),
        ProductDescriptionDesignModel(isPreviewProductImage: false, isColourOption: false, isProductDetail: true, isOffer: false, isSize: false, identifier: .productDetails),
        ProductDescriptionDesignModel(isPreviewProductImage: false, isColourOption: false, isProductDetail: true, isOffer: false, isSize: false, identifier: .deliveryOptions),
        ProductDescriptionDesignModel(isPreviewProductImage: false, isColourOption: false, isProductDetail: true, isOffer: false, isSize: false, identifier: .termsAndConditions),
        ProductDescriptionDesignModel(isPreviewProductImage: false, isColourOption: false, isProductDetail: true, isOffer: false, isSize: false, identifier: .returnsAndExchange),
        ProductDescriptionDesignModel(isPreviewProductImage: false, isColourOption: false, isProductDetail: false, isOffer: false, isSize: false, identifier: .header),
        ProductDescriptionDesignModel(isPreviewProductImage: false, isColourOption: false, isProductDetail: false, isOffer: false, isSize: false, identifier: .product),
        ProductDescriptionDesignModel(isPreviewProductImage: false, isColourOption: false, isProductDetail: false, isOffer: false, isSize: false, identifier: .product),
        ProductDescriptionDesignModel(isPreviewProductImage: false, isColourOption: false, isProductDetail: false, isOffer: false, isSize: false, identifier: .product)
    ]
    public weak var delegate : PDPViewModelDelegate?
    var productArr : PDPModel?
    var dataSource = ExpandableCellDataModel.mockedData
    var currentProduct = 0
    let url = "https://ov-dev.sssports.com/s/UAE/dw/shop/v20_10/products/UA1345776-112?select=(*,%20image_groups.(**),%20variation_attributes.(**),%20variation_groups.(**),%20inventory.(**),%20variants.(orderable,%20product_id),%20type.(**),%20variation_values.(**),%20master.(master_id))&client_id=ce6abb4e-faf1-41af-94e7-feb1e2dd4a77&expand=availability,%20variations,%20images,%20prices,%20promotions&locale=en-AE&all_images=true&action=bestprice"
    
    //MARK: Functions
    func getData(){
        APIManager.shared.fetchData(pageUrl: url, dataModel: PDPModel.self, completionHandler: {[weak self] data,error in
            if let data = data {
                self?.productArr = data
                DispatchQueue.main.async {
                    self?.delegate?.onSuccess()
                }
            } else {
                self?.delegate?.onFailure(error: error)
            }
        })
    }
    
    
}
