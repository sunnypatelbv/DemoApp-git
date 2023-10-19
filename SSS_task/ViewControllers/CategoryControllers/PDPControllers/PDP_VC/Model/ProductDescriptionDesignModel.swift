//
//  ProductDescriptionDesignModel.swift
//  SSS_task
//
//  Created by Sunny Patel on 03/10/23.
//

import Foundation

struct ProductDescriptionDesignModel {
    var isPreviewProductImage: Bool
    var isColourOption: Bool
    var isProductDetail: Bool
    var isOffer: Bool
    var isSize: Bool
    var identifier: ProductDescriptionType
}

enum ProductDescriptionType{
    case previewImage
    case colourOption
    case productDetail
    case offer
    case sizeOption
    case productDetails
    case deliveryOptions
    case termsAndConditions
    case returnsAndExchange
    case header
    case product
}
