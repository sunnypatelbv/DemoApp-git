// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let basketDataModel = try? JSONDecoder().decode(BasketDataModel.self, from: jsonData)

import Foundation

// MARK: - BasketDataModel
struct BasketDataModel: Codable {
    let v, type: String?
    let baskets: [Basket]?
    let total: Int?

    enum CodingKeys: String, CodingKey {
        case v = "_v"
        case type = "_type"
        case baskets, total
    }
}



//// MARK: - CExpressObj
//struct CExpressObj: Codable {
//    let expressQty, totalQty: Int?
//}

// MARK: - CustomerInfo
//struct CustomerInfo: Codable {
//    let type, customerID, customerNo: String?
//
//    enum CodingKeys: String, CodingKey {
//        case type = "_type"
//        case customerID = "customer_id"
//        case customerNo = "customer_no"
//    }
//}

// MARK: - Notes
//struct Notes: Codable {
//    let type: String?
//    let link: String?
//
//    enum CodingKeys: String, CodingKey {
//        case type = "_type"
//        case link
//    }
//}

//// MARK: - ProductItem
//struct ProductItem: Codable {
//    let type: String?
//    let adjustedTax: Double?
//    let basePrice: Double?
//    let bonusProductLineItem, gift: Bool?
//    let itemID, itemText: String?
//    let price, priceAfterItemDiscount, priceAfterOrderDiscount: Double?
//    let productID, productName: String?
//    let quantity: Int?
//    let shipmentID: String?
//    let tax: Double?
//    let taxBasis: Int?
//    let taxClassID: JSONNull?
//    let taxRate: Double?
//    let cBrand, cBrandCode, cExpressShipping: String?
//    let cIsBigBox, cIsCCAvailable, cIsSuperCare: Bool?
//    let cListPrice, cMaxBuyableQuantity: Int?
//    let cProductImage: String?
//    let cSelectedSize: String?
//    let cGa4Data: CGa4Data?
//
//    enum CodingKeys: String, CodingKey {
//        case type = "_type"
//        case adjustedTax = "adjusted_tax"
//        case basePrice = "base_price"
//        case bonusProductLineItem = "bonus_product_line_item"
//        case gift
//        case itemID = "item_id"
//        case itemText = "item_text"
//        case price
//        case priceAfterItemDiscount = "price_after_item_discount"
//        case priceAfterOrderDiscount = "price_after_order_discount"
//        case productID = "product_id"
//        case productName = "product_name"
//        case quantity
//        case shipmentID = "shipment_id"
//        case tax
//        case taxBasis = "tax_basis"
//        case taxClassID = "tax_class_id"
//        case taxRate = "tax_rate"
//        case cBrand = "c_brand"
//        case cBrandCode = "c_brandCode"
//        case cExpressShipping = "c_expressShipping"
//        case cIsBigBox = "c_isBigBox"
//        case cIsCCAvailable = "c_isCCAvailable"
//        case cIsSuperCare = "c_isSuperCare"
//        case cListPrice = "c_listPrice"
//        case cMaxBuyableQuantity = "c_maxBuyableQuantity"
//        case cProductImage = "c_productImage"
//        case cSelectedSize = "c_selectedSize"
//        case cGa4Data = "c_ga4data"
//    }
//}

// MARK: - ProductItem
struct ProductItem: Codable {
    let type: String?
    let adjustedTax: Double?
    let basePrice: Int?
    let bonusProductLineItem, gift: Bool?
    let itemID, itemText: String?
    let price, priceAfterItemDiscount, priceAfterOrderDiscount: Int?
    let productID, productName: String?
    let quantity: Int?
    let shipmentID: String?
    let tax: Double?
    let taxBasis: Int?
    let taxClassID: JSONNull?
    let taxRate: Double?
    let cBrand, cBrandCode, cExpressShipping: String?
    let cIsBigBox, cIsCCAvailable, cIsSuperCare: Bool?
    let cListPrice, cMaxBuyableQuantity: Int?
    let cProductImage: String?
    let cSelectedSize: String?
    let cGa4Data: CGa4Data?

    enum CodingKeys: String, CodingKey {
        case type = "_type"
        case adjustedTax = "adjusted_tax"
        case basePrice = "base_price"
        case bonusProductLineItem = "bonus_product_line_item"
        case gift
        case itemID = "item_id"
        case itemText = "item_text"
        case price
        case priceAfterItemDiscount = "price_after_item_discount"
        case priceAfterOrderDiscount = "price_after_order_discount"
        case productID = "product_id"
        case productName = "product_name"
        case quantity
        case shipmentID = "shipment_id"
        case tax
        case taxBasis = "tax_basis"
        case taxClassID = "tax_class_id"
        case taxRate = "tax_rate"
        case cBrand = "c_brand"
        case cBrandCode = "c_brandCode"
        case cExpressShipping = "c_expressShipping"
        case cIsBigBox = "c_isBigBox"
        case cIsCCAvailable = "c_isCCAvailable"
        case cIsSuperCare = "c_isSuperCare"
        case cListPrice = "c_listPrice"
        case cMaxBuyableQuantity = "c_maxBuyableQuantity"
        case cProductImage = "c_productImage"
        case cSelectedSize = "c_selectedSize"
        case cGa4Data = "c_ga4data"
    }
}

// MARK: - CGa4Data
//struct CGa4Data: Codable {
//    let itemID, itemName, itemBrand: String?
//    let index: Int?
//    let discount, coupon, itemCategory, itemCategory2: String?
//    let itemCategory3, itemCategory4, itemCategory5, itemCategory6: String?
//    let itemListID, itemListName, price: String?
//    let quantity: Int?
//    let itemOrigin, itemVariant, itemSearchTerm, itemOriginalPrice: String?
//    let itemSize, itemInstockSizes, itemOutstockSizes: String?
//
//    enum CodingKeys: String, CodingKey {
//        case itemID = "item_id"
//        case itemName = "item_name"
//        case itemBrand = "item_brand"
//        case index, discount, coupon
//        case itemCategory = "item_category"
//        case itemCategory2 = "item_category2"
//        case itemCategory3 = "item_category3"
//        case itemCategory4 = "item_category4"
//        case itemCategory5 = "item_category5"
//        case itemCategory6 = "item_category6"
//        case itemListID = "item_list_id"
//        case itemListName = "item_list_name"
//        case price, quantity
//        case itemOrigin = "item_origin"
//        case itemVariant = "item_variant"
//        case itemSearchTerm = "item_search_term"
//        case itemOriginalPrice = "item_original_price"
//        case itemSize = "item_size"
//        case itemInstockSizes = "item_instock_sizes"
//        case itemOutstockSizes = "item_outstock_sizes"
//    }
//}

// MARK: - Shipment
//struct Shipment: Codable {
//    let type: String?
//    let adjustedMerchandizeTotalTax: Double?
//    let adjustedShippingTotalTax: JSONNull?
//    let gift: Bool?
//    let merchandizeTotalTax: Double?
//    let productSubTotal, productTotal: Int?
//    let shipmentID: String?
//    let shipmentTotal: JSONNull?
//    let shippingStatus: String?
//    let shippingTotal, shippingTotalTax, taxTotal: JSONNull?
//
//    enum CodingKeys: String, CodingKey {
//        case type = "_type"
//        case adjustedMerchandizeTotalTax = "adjusted_merchandize_total_tax"
//        case adjustedShippingTotalTax = "adjusted_shipping_total_tax"
//        case gift
//        case merchandizeTotalTax = "merchandize_total_tax"
//        case productSubTotal = "product_sub_total"
//        case productTotal = "product_total"
//        case shipmentID = "shipment_id"
//        case shipmentTotal = "shipment_total"
//        case shippingStatus = "shipping_status"
//        case shippingTotal = "shipping_total"
//        case shippingTotalTax = "shipping_total_tax"
//        case taxTotal = "tax_total"
//    }
//}

// MARK: - ShippingItem
//struct ShippingItem: Codable {
//    let type: String?
//    let adjustedTax, basePrice: JSONNull?
//    let itemID, itemText: String?
//    let price, priceAfterItemDiscount: JSONNull?
//    let shipmentID: String?
//    let tax, taxBasis, taxClassID: JSONNull?
//    let taxRate: Double?
//
//    enum CodingKeys: String, CodingKey {
//        case type = "_type"
//        case adjustedTax = "adjusted_tax"
//        case basePrice = "base_price"
//        case itemID = "item_id"
//        case itemText = "item_text"
//        case price
//        case priceAfterItemDiscount = "price_after_item_discount"
//        case shipmentID = "shipment_id"
//        case tax
//        case taxBasis = "tax_basis"
//        case taxClassID = "tax_class_id"
//        case taxRate = "tax_rate"
//    }
//}

// MARK: - Encode/decode helpers

//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}
