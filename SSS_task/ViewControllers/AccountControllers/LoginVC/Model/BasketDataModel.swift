// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let basketDataModel = try? JSONDecoder().decode(BasketDataModel.self, from: jsonData)

import Foundation

// MARK: - BasketDataModel
struct BasketDataModel: Codable {
    let v, type: String?
    let baskets: [Baskets]?
    let total: Int?

    enum CodingKeys: String, CodingKey {
        case v = "_v"
        case type = "_type"
        case baskets, total
    }
}

// MARK: - Basket
struct Baskets: Codable {
    let type, resourceState: String?
    let adjustedMerchandizeTotalTax: Double?
    let adjustedShippingTotalTax: Int?
    let agentBasket: Bool?
    let basketID: String?
    let billingAddress: BasketIngAddress?
    let channelType, creationDate, currency: String?
    let customerInfo: BasketCustomerInfo?
    let lastModified: String?
    let merchandizeTotalTax: Double?
    let notes: BasketNotes?
    let orderPriceAdjustments: [BasketOrderPriceAdjustment]?
    let orderTotal: Double?
    let productItems: [ProductItem]?
    let productSubTotal: Int?
    let productTotal: Double?
    let shipments: [BasketShipment]?
    let shippingItems: [BasketShippingItem]?
    let shippingTotal, shippingTotalTax: Int?
    let taxation: String?
    let taxTotal, cCashBackTotalAmount: Double?
    let cEarnedCashbackPoints: Int?
    let cIsExpressModifiedByCustomer, cIsInstorePromoApplied, cIsLoyaltyPointsApplied: Bool?
    let cExpressObj: BasketCExpressObj?

    enum CodingKeys: String, CodingKey {
        case type = "_type"
        case resourceState = "_resource_state"
        case adjustedMerchandizeTotalTax = "adjusted_merchandize_total_tax"
        case adjustedShippingTotalTax = "adjusted_shipping_total_tax"
        case agentBasket = "agent_basket"
        case basketID = "basket_id"
        case billingAddress = "billing_address"
        case channelType = "channel_type"
        case creationDate = "creation_date"
        case currency
        case customerInfo = "customer_info"
        case lastModified = "last_modified"
        case merchandizeTotalTax = "merchandize_total_tax"
        case notes
        case orderPriceAdjustments = "order_price_adjustments"
        case orderTotal = "order_total"
        case productItems = "product_items"
        case productSubTotal = "product_sub_total"
        case productTotal = "product_total"
        case shipments
        case shippingItems = "shipping_items"
        case shippingTotal = "shipping_total"
        case shippingTotalTax = "shipping_total_tax"
        case taxation
        case taxTotal = "tax_total"
        case cCashBackTotalAmount = "c_cashBackTotalAmount"
        case cEarnedCashbackPoints = "c_earnedCashbackPoints"
        case cIsExpressModifiedByCustomer = "c_isExpressModifiedByCustomer"
        case cIsInstorePromoApplied = "c_isInstorePromoApplied"
        case cIsLoyaltyPointsApplied = "c_isLoyaltyPointsApplied"
        case cExpressObj = "c_expressObj"
    }
}

// MARK: - IngAddress
struct BasketIngAddress: Codable {
    let type, address1, address2, city: String?
    let countryCode, firstName, fullName, id: String?
    let lastName, phone, salutation, cArea: String?
    let cBuildingName, cEmail, cFlatNumber, cLatitude: String?
    let cLongitude: String?

    enum CodingKeys: String, CodingKey {
        case type = "_type"
        case address1, address2, city
        case countryCode = "country_code"
        case firstName = "first_name"
        case fullName = "full_name"
        case id
        case lastName = "last_name"
        case phone, salutation
        case cArea = "c_area"
        case cBuildingName = "c_buildingName"
        case cEmail = "c_email"
        case cFlatNumber = "c_flatNumber"
        case cLatitude = "c_latitude"
        case cLongitude = "c_longitude"
    }
}

// MARK: - CExpressObj
struct BasketCExpressObj: Codable {
    let expressQty, totalQty: Int?
}

// MARK: - CustomerInfo
struct BasketCustomerInfo: Codable {
    let type, customerID, customerNo: String?

    enum CodingKeys: String, CodingKey {
        case type = "_type"
        case customerID = "customer_id"
        case customerNo = "customer_no"
    }
}

// MARK: - Notes
struct BasketNotes: Codable {
    let type: String?
    let link: String?

    enum CodingKeys: String, CodingKey {
        case type = "_type"
        case link
    }
}

// MARK: - OrderPriceAdjustment
struct BasketOrderPriceAdjustment: Codable {
    let type: String?
    let appliedDiscount: BasketAppliedDiscount?
    let creationDate: String?
    let custom: Bool?
    let itemText, lastModified: String?
    let manual: Bool?
    let price: Double?
    let priceAdjustmentID, promotionID: String?
    let promotionLink: String?

    enum CodingKeys: String, CodingKey {
        case type = "_type"
        case appliedDiscount = "applied_discount"
        case creationDate = "creation_date"
        case custom
        case itemText = "item_text"
        case lastModified = "last_modified"
        case manual, price
        case priceAdjustmentID = "price_adjustment_id"
        case promotionID = "promotion_id"
        case promotionLink = "promotion_link"
    }
}

// MARK: - AppliedDiscount
struct BasketAppliedDiscount: Codable {
    let type: String?
    let amount: Double?
    let appliedDiscountType: String?
    let percentage: Int?

    enum CodingKeys: String, CodingKey {
        case type = "_type"
        case amount
        case appliedDiscountType = "type"
        case percentage
    }
}

// MARK: - ProductItem
struct ProductItem: Codable {
    let type: String?
    let adjustedTax: Double?
    let basePrice: Int?
    let bonusProductLineItem, gift: Bool?
    let itemID, itemText: String?
    let price, priceAfterItemDiscount: Double?
    let priceAfterOrderDiscount: Double?
    let productID, productName: String?
    let quantity: Int?
    let shipmentID: String?
    let tax, taxBasis: Double?
    let taxClassID: JSONNull?
    let taxRate: Double?
    let cBrand, cBrandCode, cExpressShipping: String?
    let cIsBigBox, cIsCCAvailable, cIsSuperCare: Bool?
    let cListPrice, cMaxBuyableQuantity: Int?
    let cProductImage: String?
    let cSelectedSize: String?
    let cGa4Data: BasketCGa4Data?

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
struct BasketCGa4Data: Codable {
    let itemID, itemName, itemBrand: String?
    let index: Int?
    let discount, coupon, itemCategory, itemCategory2: String?
    let itemCategory3, itemCategory4, itemCategory5, itemCategory6: String?
    let itemListID, itemListName, price: String?
    let quantity: Int?
    let itemOrigin, itemVariant, itemSearchTerm, itemOriginalPrice: String?
    let itemSize, itemInstockSizes, itemOutstockSizes: String?

    enum CodingKeys: String, CodingKey {
        case itemID = "item_id"
        case itemName = "item_name"
        case itemBrand = "item_brand"
        case index, discount, coupon
        case itemCategory = "item_category"
        case itemCategory2 = "item_category2"
        case itemCategory3 = "item_category3"
        case itemCategory4 = "item_category4"
        case itemCategory5 = "item_category5"
        case itemCategory6 = "item_category6"
        case itemListID = "item_list_id"
        case itemListName = "item_list_name"
        case price, quantity
        case itemOrigin = "item_origin"
        case itemVariant = "item_variant"
        case itemSearchTerm = "item_search_term"
        case itemOriginalPrice = "item_original_price"
        case itemSize = "item_size"
        case itemInstockSizes = "item_instock_sizes"
        case itemOutstockSizes = "item_outstock_sizes"
    }
}

// MARK: - Shipment
struct BasketShipment: Codable {
    let type: String?
    let adjustedMerchandizeTotalTax: Double?
    let adjustedShippingTotalTax: Int?
    let gift: Bool?
    let merchandizeTotalTax: Double?
    let productSubTotal: Int?
    let productTotal: Double?
    let shipmentID: String?
    let shipmentTotal: Int?
    let shippingAddress: BasketIngAddress?
    let shippingMethod: BasketShippingMethod?
    let shippingStatus: String?
    let shippingTotal, shippingTotalTax: Int?
    let taxTotal: Double?

    enum CodingKeys: String, CodingKey {
        case type = "_type"
        case adjustedMerchandizeTotalTax = "adjusted_merchandize_total_tax"
        case adjustedShippingTotalTax = "adjusted_shipping_total_tax"
        case gift
        case merchandizeTotalTax = "merchandize_total_tax"
        case productSubTotal = "product_sub_total"
        case productTotal = "product_total"
        case shipmentID = "shipment_id"
        case shipmentTotal = "shipment_total"
        case shippingAddress = "shipping_address"
        case shippingMethod = "shipping_method"
        case shippingStatus = "shipping_status"
        case shippingTotal = "shipping_total"
        case shippingTotalTax = "shipping_total_tax"
        case taxTotal = "tax_total"
    }
}

// MARK: - ShippingMethod
struct BasketShippingMethod: Codable {
    let type, id, name: String?
    let price: Int?
    let shippingPromotions: [BasketShippingPromotion]?
    let cEstimatedArrivalTime, cFluentShippingCode: String?
    let cHideForBigBox, cIsLeaveAtDoorEnabled: Bool?
    let cLeaveAtDoorDescription, cLeaveAtDoorLabel, cShippingMethodTimesMessage, cShippingMethodTimesSubMessage: String?
    let cStorePickupEnabled: Bool?
    let cSummaryDisplayName: String?

    enum CodingKeys: String, CodingKey {
        case type = "_type"
        case id, name, price
        case shippingPromotions = "shipping_promotions"
        case cEstimatedArrivalTime = "c_estimatedArrivalTime"
        case cFluentShippingCode = "c_fluentShippingCode"
        case cHideForBigBox = "c_hideForBigBox"
        case cIsLeaveAtDoorEnabled = "c_isLeaveAtDoorEnabled"
        case cLeaveAtDoorDescription = "c_leaveAtDoorDescription"
        case cLeaveAtDoorLabel = "c_leaveAtDoorLabel"
        case cShippingMethodTimesMessage = "c_shippingMethodTimesMessage"
        case cShippingMethodTimesSubMessage = "c_shippingMethodTimesSubMessage"
        case cStorePickupEnabled = "c_storePickupEnabled"
        case cSummaryDisplayName = "c_summaryDisplayName"
    }
}

// MARK: - ShippingPromotion
struct BasketShippingPromotion: Codable {
    let type: String?
    let link: String?
    let promotionID, promotionName: String?

    enum CodingKeys: String, CodingKey {
        case type = "_type"
        case link
        case promotionID = "promotion_id"
        case promotionName = "promotion_name"
    }
}

// MARK: - ShippingItem
struct BasketShippingItem: Codable {
    let type: String?
    let adjustedTax, basePrice: Int?
    let itemID, itemText: String?
    let price, priceAfterItemDiscount: Int?
    let shipmentID: String?
    let tax, taxBasis: Int?
    let taxClassID: String?
    let taxRate: Double?
    let cBasketTotalPrice: Int?
    let cCurrencyCode: String?
    let cShippingCostFromShipment: Int?

    enum CodingKeys: String, CodingKey {
        case type = "_type"
        case adjustedTax = "adjusted_tax"
        case basePrice = "base_price"
        case itemID = "item_id"
        case itemText = "item_text"
        case price
        case priceAfterItemDiscount = "price_after_item_discount"
        case shipmentID = "shipment_id"
        case tax
        case taxBasis = "tax_basis"
        case taxClassID = "tax_class_id"
        case taxRate = "tax_rate"
        case cBasketTotalPrice = "c_basketTotalPrice"
        case cCurrencyCode = "c_currencyCode"
        case cShippingCostFromShipment = "c_shippingCostFromShipment"
    }
}

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
