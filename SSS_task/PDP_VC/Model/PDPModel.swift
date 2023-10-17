
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
    let name: CProductURLName?
    let price, pricePerUnit: Int?
    let primaryCategoryID, shortDescription: String?
    let stepQuantity: Int?
    let pdpModelType: TypeClass?
    let unitQuantity: Int?
    let validFrom: ValidFrom?
    let variants: [Variant]?
    let variationAttributes: [PDPModelVariationAttribute]?
    let variationGroups: [VariationGroup]?
    let variationValues: VariationValues?
    let cL2Cat, cL4Cat, cL5Cat, cAh1Text: String?
    let cAh2Text: String?
    let cAvailableForInStorePickup: Bool?
    let cBrandOrder: Int?
    let cBrandTranslated, cCoreSizeValue: String?
    let cCostPriceAED: Double?
    let cGender, cGenericArticleNo, cGmgColor, cGmgSleeveLength: String?
    let cIsBigBox, cIsCCAvailable, cIsEASale, cIsNew: Bool?
    let cIsReturnable: Bool?
    let cProductGroup, cProductPhotos: String?
    let cProductURLName: CProductURLName?
    let cSapSport, cSeason: String?
    let cSeasonSortable: Int?
    let cSeasonYear: String?
    let cSeasonYearSortable: Int?
    let cSecondaryColor, cSport, cSubGroup: String?
    let cTotalDiscountPercentageEA: Int?
    let cVendorArticleNumber, cVendorColor: String?
    let cBadges: CBadges?
    let cMaxBuyableQuantity: Int?
    let cSizeChartID: CSizeChartID?
    let cIsQuickBuyAvailable: Bool?
    let cSalePrice, cListPrice: Int?
    let cPercentage: String?
    let cOriginalListPrice: Int?
    let cPrimaryCategoryID, cCategory, cCategoryDash, cSubCategory: String?
    let cSubCategoryDash: String?
    let cBestPrice: CBestPrice?
    let cTermsAndConditionsText, cSportDash, cBrandDash: String?
    let cExpress: CExpress?

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
        case validFrom = "valid_from"
        case variants
        case variationAttributes = "variation_attributes"
        case variationGroups = "variation_groups"
        case variationValues = "variation_values"
        case cL2Cat = "c_L2_cat"
        case cL4Cat = "c_L4_cat"
        case cL5Cat = "c_L5_cat"
        case cAh1Text = "c_ah1text"
        case cAh2Text = "c_ah2text"
        case cAvailableForInStorePickup = "c_availableForInStorePickup"
        case cBrandOrder = "c_brandOrder"
        case cBrandTranslated = "c_brandTranslated"
        case cCoreSizeValue = "c_coreSizeValue"
        case cCostPriceAED = "c_costPriceAED"
        case cGender = "c_gender"
        case cGenericArticleNo = "c_genericArticleNo"
        case cGmgColor = "c_gmgColor"
        case cGmgSleeveLength = "c_gmg_sleeve_length"
        case cIsBigBox = "c_isBigBox"
        case cIsCCAvailable = "c_isCCAvailable"
        case cIsEASale = "c_isEASale"
        case cIsNew = "c_isNew"
        case cIsReturnable = "c_isReturnable"
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
        case cTotalDiscountPercentageEA = "c_totalDiscountPercentageEA"
        case cVendorArticleNumber = "c_vendorArticleNumber"
        case cVendorColor = "c_vendorColor"
        case cBadges = "c_badges"
        case cMaxBuyableQuantity = "c_maxBuyableQuantity"
        case cSizeChartID = "c_sizeChartID"
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
    }
}

// MARK: - CBadges
//struct CBadges: Codable {
//    let automated: [String]?
//}

// MARK: - CBestPrice
struct CBestPrice: Codable {
    let value: Double?
    let formatted, message, noteMessage: String?
    let promos: [String]?
}

// MARK: - CExpress
//struct CExpress: Codable {
//    let enabled: Bool?
//    let quantityForEligible: JSONNull?
//    let expObj: ExpObj?
//    let location: Location?
//}

// MARK: - ExpObj
struct ExpObj: Codable {
    let labelMessage, valueMessage, hoursDisplay, minutesDisplay: String?
    let isExpressAvailableForArea: Bool?
    let arrivingDate, standardEstimatedTime: String?
    let isExpressAvailableForProduct: Bool?
    let contentMessage: String?
}

// MARK: - Location
struct Location: Codable {
    let choosenShippingAddress: ChoosenShippingAddress?
    let isDefaultLocation: Bool?
}

// MARK: - ChoosenShippingAddress
struct ChoosenShippingAddress: Codable {
    let countryCode, city, area: String?
}

enum CProductURLName: String, Codable {
    case menSSportstyleTerryFullZipHoodie = "Men's Sportstyle Terry Full Zip Hoodie"
}

// MARK: - CSizeChartID
struct CSizeChartID: Codable {
    let id, selector: String?
}

// MARK: - ImageGroup
struct ImageGroup: Codable {
    let type: String?
    let images: [Image]?
    let variationAttributes: [ImageGroupVariationAttribute]?
    let viewType: String?

    enum CodingKeys: String, CodingKey {
        case type = "_type"
        case images
        case variationAttributes = "variation_attributes"
        case viewType = "view_type"
    }
}

// MARK: - Image
//struct Image: Codable {
//    let type: TypeEnum?
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

enum TypeEnum: String, Codable {
    case image = "image"
    case product = "product"
}

// MARK: - ImageGroupVariationAttribute
struct ImageGroupVariationAttribute: Codable {
    let type, id: String?
    let values: [PurpleValue]?

    enum CodingKeys: String, CodingKey {
        case type = "_type"
        case id, values
    }
}

// MARK: - PurpleValue
struct PurpleValue: Codable {
    let type, value: String?

    enum CodingKeys: String, CodingKey {
        case type = "_type"
        case value
    }
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

// MARK: - ValidFrom
struct ValidFrom: Codable {
    let validFromDefault: String?

    enum CodingKeys: String, CodingKey {
        case validFromDefault = "default"
    }
}

// MARK: - Variant
struct Variant: Codable {
    let type: String?
    let orderable: Bool?
    let productID: String?

    enum CodingKeys: String, CodingKey {
        case type = "_type"
        case orderable
        case productID = "product_id"
    }
}

// MARK: - PDPModelVariationAttribute
struct PDPModelVariationAttribute: Codable {
    let type, id, name: String?
    let values: [FluffyValue]?

    enum CodingKeys: String, CodingKey {
        case type = "_type"
        case id, name, values
    }
}

// MARK: - FluffyValue
struct FluffyValue: Codable {
    let type, name: String?
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
