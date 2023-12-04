// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let productInformationModel = try? JSONDecoder().decode(ProductInformationModel.self, from: jsonData)

import Foundation

// MARK: - ProductInformationModel
struct ProductInformationModel: Codable {
    let v, type: String?
    let count: Int?
    let hits: [Hit]?
    let next: String?
    let refinements: [Refinement]?
    let searchPhraseSuggestions: SearchPhraseSuggestions?
    let selectedRefinements: SelectedRefinements?
    let sortingOptions: [SortingOption]?
    let start, total: Int?
    

    enum CodingKeys: String, CodingKey {
        case v = "_v"
        case type = "_type"
        case count, hits, next, refinements
        case searchPhraseSuggestions = "search_phrase_suggestions"
        case selectedRefinements = "selected_refinements"
        case sortingOptions = "sorting_options"
        case start, total
        
    }
}


// MARK: - Hit
struct Hit: Codable {
    let type: HitType?
    let currency: Currency?
    let hitType: HitTypeEnum?
    let link: String?
    let price, pricePerUnit: Int?
    let productID, productName: String?
    let productType: ProductType?
    let representedProduct: RepresentedProduct?
    let representedProducts: [RepresentedProduct]?
    let cBrand: CBrand?
    let cSport: CSport?
    let cColorsCount: Int?
    let cBadges: CBadges?
    let cProductImages: CProductImages?
    let cSalePrice, cListPrice: Int?
    let cPercentage: String?
    let cExpress: CExpress?
    let cPrimaryCategoryID: CPrimaryCategoryID?
    let cCategory: CCategory?
    let cCategoryDash: CCategoryDash?
    let cSubCategory, cSubCategoryDash, cColor, cGmgColor: String?
    let cSportDash, cAh1Text, cAh2Text: String?
    let cGender: CGender?
    let cBrandDash: CBrandDash?
    let cBrandTranslated: CBrand?
    let cCategoryHeader: String?
    let cCurrentCategory: CBrand?
    let cParentCategory, cPlpCategoryID: String?
    let cShowPlpWidgets: Bool?
    let cCategoryTopBanner: CC?
    let cCircleWidgets: [CC]?
    let cPlpBrand, cPlpBrandDash: CBrandDash?
    let cCountDownTimer: CCountDownTimer?
    let cSubCategory2, cSubCategory2Dash: String?
    let image: Image?

    enum CodingKeys: String, CodingKey {
        case type = "_type"
        case currency
        case hitType = "hit_type"
        case link, price
        case pricePerUnit = "price_per_unit"
        case productID = "product_id"
        case productName = "product_name"
        case productType = "product_type"
        case representedProduct = "represented_product"
        case representedProducts = "represented_products"
        case cBrand = "c_brand"
        case cSport = "c_sport"
        case cColorsCount = "c_colorsCount"
        case cBadges = "c_badges"
        case cProductImages = "c_productImages"
        case cSalePrice = "c_salePrice"
        case cListPrice = "c_listPrice"
        case cPercentage = "c_percentage"
        case cExpress = "c_express"
        case cPrimaryCategoryID = "c_primaryCategoryId"
        case cCategory = "c_category"
        case cCategoryDash = "c_categoryDash"
        case cSubCategory = "c_subCategory"
        case cSubCategoryDash = "c_subCategoryDash"
        case cColor = "c_color"
        case cGmgColor = "c_gmgColor"
        case cSportDash = "c_sportDash"
        case cAh1Text = "c_ah1text"
        case cAh2Text = "c_ah2text"
        case cGender = "c_gender"
        case cBrandDash = "c_brandDash"
        case cBrandTranslated = "c_brandTranslated"
        case cCategoryHeader = "c_categoryHeader"
        case cCurrentCategory = "c_currentCategory"
        case cParentCategory = "c_parentCategory"
        case cPlpCategoryID = "c_plpCategoryId"
        case cShowPlpWidgets = "c_showPlpWidgets"
        case cCategoryTopBanner = "c_categoryTopBanner"
        case cCircleWidgets = "c_circleWidgets"
        case cPlpBrand = "c_plp_brand"
        case cPlpBrandDash = "c_plp_brand_dash"
        case cCountDownTimer = "c_countDownTimer"
        case cSubCategory2 = "c_subCategory2"
        case cSubCategory2Dash = "c_subCategory2Dash"
        case image
    }
}

// MARK: - CBadges
struct CBadges: Codable {
    let automated: [String]?
}

enum CBrand: String, Codable {
    case nike = "Nike"
}

enum CBrandDash: String, Codable {
    case nike = "nike"
}

enum CCategory: String, Codable {
    case clothing = "Clothing"
    case shoes = "Shoes"
}

enum CCategoryDash: String, Codable {
    case clothing = "clothing"
    case shoes = "shoes"
}

// MARK: - CC
struct CC: Codable {
    let image: String?
    let navigationURL: String?
    let deepLink, title: String?
}

// MARK: - CCountDownTimer
struct CCountDownTimer: Codable {
    let isShown: Bool?
    let bannerText: String?
    let showCountdownTimerDaysOnPDP, showCountdownTimerDaysOnPLP: Bool?
    let endDate, endDateSiteBasedTimeStamp, siteTimeStamp: String?
}

enum CGender: String, Codable {
    case kids = "kids"
    case mens = "mens"
    case unisex = "unisex"
    case womens = "womens"
}

enum CPrimaryCategoryID: String, Codable {
    case brandsNikeClothing = "brands_nike_clothing"
    case brandsNikeShoes = "brands_nike_shoes"
}

// MARK: - CProductImages
struct CProductImages: Codable {
    let small, medium, large: [Large]?
}

// MARK: - Large
struct Large: Codable {
    let alt, title: String?
    let index: Int?
    let url: String?
    let devicesConfig: DevicesConfig?
    let srcset: Srcset?
}

// MARK: - DevicesConfig
struct DevicesConfig: Codable {
    let hires, desktop, tablet, mobile: Desktop?
    let desktopRetina, tabletRetina, mobileRetina: Desktop?
}

// MARK: - Desktop
struct Desktop: Codable {
    let scaleWidth, scaleHeight: Int?
    let scaleMode: ScaleMode?
}

enum ScaleMode: String, Codable {
    case fit = "fit"
}

// MARK: - Srcset
struct Srcset: Codable {
    let hires, desktop, tablet, mobile: String?
    let desktopRetina, tabletRetina, mobileRetina: String?
}

enum CSport: String, Codable {
    case basketball = "Basketball"
    case running = "Running"
    case sportsFashion = "Sports Fashion"
    case training = "Training"
}

enum Currency: String, Codable {
    case aed = "AED"
}

enum HitTypeEnum: String, Codable {
    case variationGroup = "variation_group"
}

// MARK: - Image
struct Image: Codable {
    let type, alt: String?
    let disBaseLink, link: String?
    let title: String?

    enum CodingKeys: String, CodingKey {
        case type = "_type"
        case alt
        case disBaseLink = "dis_base_link"
        case link, title
    }
}

// MARK: - ProductType
struct ProductType: Codable {
    let type: ProductTypeType?
    let variationGroup: Bool?

    enum CodingKeys: String, CodingKey {
        case type = "_type"
        case variationGroup = "variation_group"
    }
}

enum ProductTypeType: String, Codable {
    case productType = "product_type"
}

// MARK: - RepresentedProduct
struct RepresentedProduct: Codable {
    let type: RepresentedProductType?
    let id: String?
    let link: String?

    enum CodingKeys: String, CodingKey {
        case type = "_type"
        case id, link
    }
}

enum RepresentedProductType: String, Codable {
    case productRef = "product_ref"
}

enum HitType: String, Codable {
    case productSearchHit = "product_search_hit"
}

// MARK: - Refinement
struct Refinement: Codable {
    let type: RefinementType?
    let attributeID, label: String?
    let values: [RefinementValue]?

    enum CodingKeys: String, CodingKey {
        case type = "_type"
        case attributeID = "attribute_id"
        case label, values
    }
}

enum RefinementType: String, Codable {
    case productSearchRefinement = "product_search_refinement"
}

// MARK: - RefinementValue
struct RefinementValue: Codable {
    let type: ValueType?
    let hitCount: Int?
    let label, value, description, presentationID: String?
    let values: [ValueValue]?

    enum CodingKeys: String, CodingKey {
        case type = "_type"
        case hitCount = "hit_count"
        case label, value, description
        case presentationID = "presentation_id"
        case values
    }
}

enum ValueType: String, Codable {
    case productSearchRefinementValue = "product_search_refinement_value"
    case variationAttributeValue = "variation_attribute_value"
}

// MARK: - ValueValue
struct ValueValue: Codable {
    let type: ValueType?
    let hitCount: Int?
    let label, value: String?
    let values: [ValueValue]?

    enum CodingKeys: String, CodingKey {
        case type = "_type"
        case hitCount = "hit_count"
        case label, value, values
    }
}

// MARK: - SearchPhraseSuggestions
struct SearchPhraseSuggestions: Codable {
    let type: String?

    enum CodingKeys: String, CodingKey {
        case type = "_type"
    }
}

// MARK: - SelectedRefinements
struct SelectedRefinements: Codable {
    let cgid, htype, orderableOnly, price: String?

    enum CodingKeys: String, CodingKey {
        case cgid, htype
        case orderableOnly = "orderable_only"
        case price
    }
}

// MARK: - SortingOption
struct SortingOption: Codable {
    let type, id, label: String?

    enum CodingKeys: String, CodingKey {
        case type = "_type"
        case id, label
    }
}

