// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let pDPModel = try? JSONDecoder().decode(PDPModel.self, from: jsonData)

import Foundation

// MARK: - PDPModel
struct PDPModel: Codable {
    let v, type, brand, currency: String?
    let id: String?
    let imageGroups: [ImageGroup]?
    let inventory: Inventory?
    let master: Master?
    let minOrderQuantity: Int?
    let name: String?
    let price, pricePerUnit: Int?
    let primaryCategoryID, shortDescription: String?
    let stepQuantity: Int?
    let pdpModelType: TypeClass?
    let unitQuantity: Int?
    let variants: [Variant]?
    let variationAttributes: [PDPModelVariationAttribute]?
    let variationGroups: [VariationGroup]?
    let variationValues: VariationValues?
    let cL0Cat, cL1Cat, cL2Cat, cL3Cat: String?
    let cL4Cat: String?
    let cL6CatMulti: [String]?
    let cAh1Text, cAh2Text: String?
    let cAvailableForInStorePickup: Bool?
    let cBrandOrder: Int?
    let cBrandTranslated, cCoreSizeValue: String?
    let cDisableAutomatedBadges: Bool?
    let cGender, cGenericArticleNo, cGmgColor: String?
    let cGmgCancellable: Bool?
    let cGmgColorRank, cGmgFastening, cGmgFootwearHeight: String?
    let cGmgIsReturnable: Bool?
    let cGmgSport: String?
    let cIsBigBox, cIsCCAvailable, cIsNew, cIsReturnable: Bool?
    let cNikeBrands, cNikeSport, cNkGender, cProductGroup: String?
    let cProductPhotos: String?
    let cProductURLName: String?
    let cSapSport, cSeason: String?
    let cSeasonSortable: Int?
    let cSeasonYear: String?
    let cSeasonYearSortable: Int?
    let cSecondaryColor, cSport, cSubGroup, cVariantColor: String?
    let cVendorArticleNumber, cVendorColor: String?
    let cBadges: CBadges?
    let cMaxBuyableQuantity: Int?
    let cSizeChartID: CSizeChartID?
    let cPromotions: [CPromotion]?
    let cIsQuickBuyAvailable: Bool?
    let cSalePrice, cListPrice: Int?
    let cPercentage: String?
    let cOriginalListPrice: Int?
    let cPrimaryCategoryID, cCategory, cCategoryDash, cSubCategory: String?
    let cSubCategoryDash: String?
    let cBestPrice: CBestPrice?
    let cTermsAndConditionsText, cSportDash, cBrandDash: String?
    let cExpress: CExpress?
    let cGa4Data: CGa4Data?

    enum CodingKeys: String, CodingKey {
        case v = "_v"
        case type = "_type"
        case brand, currency, id
        case imageGroups = "image_groups"
        case inventory, master
        case minOrderQuantity = "min_order_quantity"
        case name, price
        case pricePerUnit = "price_per_unit"
        case primaryCategoryID = "primary_category_id"
        case shortDescription = "short_description"
        case stepQuantity = "step_quantity"
        case pdpModelType = "type"
        case unitQuantity = "unit_quantity"
        case variants
        case variationAttributes = "variation_attributes"
        case variationGroups = "variation_groups"
        case variationValues = "variation_values"
        case cL0Cat = "c_L0_cat"
        case cL1Cat = "c_L1_cat"
        case cL2Cat = "c_L2_cat"
        case cL3Cat = "c_L3_cat"
        case cL4Cat = "c_L4_cat"
        case cL6CatMulti = "c_L6_cat_multi"
        case cAh1Text = "c_ah1text"
        case cAh2Text = "c_ah2text"
        case cAvailableForInStorePickup = "c_availableForInStorePickup"
        case cBrandOrder = "c_brandOrder"
        case cBrandTranslated = "c_brandTranslated"
        case cCoreSizeValue = "c_coreSizeValue"
        case cDisableAutomatedBadges = "c_disableAutomatedBadges"
        case cGender = "c_gender"
        case cGenericArticleNo = "c_genericArticleNo"
        case cGmgColor = "c_gmgColor"
        case cGmgCancellable = "c_gmg_cancellable"
        case cGmgColorRank = "c_gmg_colorRank"
        case cGmgFastening = "c_gmg_fastening"
        case cGmgFootwearHeight = "c_gmg_footwear_height"
        case cGmgIsReturnable = "c_gmg_isReturnable"
        case cGmgSport = "c_gmg_sport"
        case cIsBigBox = "c_isBigBox"
        case cIsCCAvailable = "c_isCCAvailable"
        case cIsNew = "c_isNew"
        case cIsReturnable = "c_isReturnable"
        case cNikeBrands = "c_nikeBrands"
        case cNikeSport = "c_nikeSport"
        case cNkGender = "c_nk_gender"
        case cProductGroup = "c_productGroup"
        case cProductPhotos = "c_productPhotos"
        case cProductURLName = "c_productUrlName"
        case cSapSport = "c_sapSport"
        case cSeason = "c_season"
        case cSeasonSortable = "c_seasonSortable"
        case cSeasonYear = "c_seasonYear"
        case cSeasonYearSortable = "c_seasonYearSortable"
        case cSecondaryColor = "c_secondaryColor"
        case cSport = "c_sport"
        case cSubGroup = "c_subGroup"
        case cVariantColor = "c_variantColor"
        case cVendorArticleNumber = "c_vendorArticleNumber"
        case cVendorColor = "c_vendorColor"
        case cBadges = "c_badges"
        case cMaxBuyableQuantity = "c_maxBuyableQuantity"
        case cSizeChartID = "c_sizeChartID"
        case cPromotions = "c_promotions"
        case cIsQuickBuyAvailable = "c_isQuickBuyAvailable"
        case cSalePrice = "c_salePrice"
        case cListPrice = "c_listPrice"
        case cPercentage = "c_percentage"
        case cOriginalListPrice = "c_originalListPrice"
        case cPrimaryCategoryID = "c_primaryCategoryId"
        case cCategory = "c_category"
        case cCategoryDash = "c_categoryDash"
        case cSubCategory = "c_subCategory"
        case cSubCategoryDash = "c_subCategoryDash"
        case cBestPrice = "c_bestPrice"
        case cTermsAndConditionsText = "c_termsAndConditionsText"
        case cSportDash = "c_sportDash"
        case cBrandDash = "c_brandDash"
        case cExpress = "c_express"
        case cGa4Data = "c_ga4data"
    }
}

//// MARK: - CBadges
//struct CBadges: Codable {
//    let automated: [String]?
//}

// MARK: - CBestPrice
struct CBestPrice: Codable {
    let value: Double?
    let formatted, message, noteMessage: String?
    let promos: [String]?
}

//// MARK: - CExpress
//struct CExpress: Codable {
//    let enabled: Bool?
//    let quantityForEligible: JSONNull?
//    let expObj: ExpObj?
//    let location: Location?
//}

// MARK: - Location
struct Location: Codable {
    let choosenShippingAddress: ChoosenShippingAddress?
    let isDefaultLocation: Bool?
}

// MARK: - ChoosenShippingAddress
struct ChoosenShippingAddress: Codable {
    let countryCode, city, area: String?
}

//enum CProductURLName: String, Codable {
//    case menSKyrie6BasketballShoe = "Men's Kyrie 6 Basketball Shoe"
//}

// MARK: - CPromotion
struct CPromotion: Codable {
    let id: String?
    let name: String?
    let terms, discountPercentage, promoCode: String?

    enum CodingKeys: String, CodingKey {
        case id, name, terms
        case discountPercentage = "discount_percentage"
        case promoCode = "promo_code"
    }
}

// MARK: - CSizeChartID
struct CSizeChartID: Codable {
    let id, selector: String?
}

// MARK: - ImageGroup
struct ImageGroup: Codable {
    let type: ImageGroupType?
    let images: [Image]?
    let variationAttributes: [ImageGroupVariationAttribute]?
    let viewType: ViewType?

    enum CodingKeys: String, CodingKey {
        case type = "_type"
        case images
        case variationAttributes = "variation_attributes"
        case viewType = "view_type"
    }
}

//// MARK: - Image
//struct Image: Codable {
//    let type: ImageType?
//    let alt: CProductURLName?
//    let disBaseLink, link: String?
//    let title: CProductURLName?
//
//    enum CodingKeys: String, CodingKey {
//        case type = "_type"
//        case alt
//        case disBaseLink = "dis_base_link"
//        case link, title
//    }
//}

enum ImageType: String, Codable {
    case image = "image"
}

enum ImageGroupType: String, Codable {
    case imageGroup = "image_group"
}

// MARK: - ImageGroupVariationAttribute
struct ImageGroupVariationAttribute: Codable {
    let type: VariationAttributeType?
    let id: ID?
    let values: [PurpleValue]?

    enum CodingKeys: String, CodingKey {
        case type = "_type"
        case id, values
    }
}

enum ID: String, Codable {
    case variantColor = "variantColor"
}

enum VariationAttributeType: String, Codable {
    case variationAttribute = "variation_attribute"
}

// MARK: - PurpleValue
struct PurpleValue: Codable {
    let type: ValueType?
    let value: String?

    enum CodingKeys: String, CodingKey {
        case type = "_type"
        case value
    }
}



enum ViewType: String, Codable {
    case hiRes = "hi-res"
    case hiResNk = "hi-res-nk"
    case swatch = "swatch"
    case swatchNk = "swatch-nk"
}

// MARK: - Inventory
struct Inventory: Codable {
    let type: String?
    let ats: Int?
    let backorderable: Bool?
    let id: String?
    let orderable, preorderable: Bool?
    let stockLevel: Int?

    enum CodingKeys: String, CodingKey {
        case type = "_type"
        case ats, backorderable, id, orderable, preorderable
        case stockLevel = "stock_level"
    }
}

// MARK: - Master
struct Master: Codable {
    let type, masterID: String?

    enum CodingKeys: String, CodingKey {
        case type = "_type"
        case masterID = "master_id"
    }
}

// MARK: - TypeClass
struct TypeClass: Codable {
    let type: String?
    let variationGroup: Bool?

    enum CodingKeys: String, CodingKey {
        case type = "_type"
        case variationGroup = "variation_group"
    }
}

// MARK: - Variant
struct Variant: Codable {
    let type: VariantType?
    let orderable: Bool?
    let productID: String?

    enum CodingKeys: String, CodingKey {
        case type = "_type"
        case orderable
        case productID = "product_id"
    }
}

enum VariantType: String, Codable {
    case variant = "variant"
}

// MARK: - PDPModelVariationAttribute
struct PDPModelVariationAttribute: Codable {
    let type: VariationAttributeType?
    let id, name: String?
    let values: [FluffyValue]?

    enum CodingKeys: String, CodingKey {
        case type = "_type"
        case id, name, values
    }
}

// MARK: - FluffyValue
struct FluffyValue: Codable {
    let type: ValueType?
    let name: String?
    let orderable: Bool?
    let value: String?

    enum CodingKeys: String, CodingKey {
        case type = "_type"
        case name, orderable, value
    }
}

// MARK: - VariationGroup
struct VariationGroup: Codable {
    let type: String?
    let link: String?
    let orderable: Bool?
    let productID: String?
    let variationValues: VariationValues?

    enum CodingKeys: String, CodingKey {
        case type = "_type"
        case link, orderable
        case productID = "product_id"
        case variationValues = "variation_values"
    }
}

// MARK: - VariationValues
struct VariationValues: Codable {
    let variantColor: String?
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
