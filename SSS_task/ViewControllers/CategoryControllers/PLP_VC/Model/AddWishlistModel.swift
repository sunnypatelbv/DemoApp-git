// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let addWishlistModel = try? JSONDecoder().decode(AddWishlistModel.self, from: jsonData)

import Foundation

// MARK: - AddWishlistModel
struct AddWishlistModel: Codable {
    let v, type, resourceState: String?
    let flash: [Flash]?
    let id: String?
    let priority: Int?
    let productDetailsLink: ProductDetailsLink?
    let productID: String?
    let addWishlistModelPublic: Bool?
    let purchasedQuantity, quantity: Int?
    let addWishlistModelType: String?
    let fault: Fault?
    
    enum CodingKeys: String, CodingKey {
        case v = "_v"
        case type = "_type"
        case resourceState = "_resource_state"
        case flash = "_flash"
        case id, priority
        case productDetailsLink = "product_details_link"
        case productID = "product_id"
        case addWishlistModelPublic = "public"
        case purchasedQuantity = "purchased_quantity"
        case quantity
        case addWishlistModelType = "type"
        case fault
    }
}

// MARK: - Fault
struct Fault: Codable {
    let type, message: String?
}

// MARK: - Flash
struct Flash: Codable {
    let type, flashType: String?

    enum CodingKeys: String, CodingKey {
        case type = "_type"
        case flashType = "type"
    }
}

// MARK: - ProductDetailsLink
struct ProductDetailsLink: Codable {
    let type: String?
    let link: String?
    let title: String?

    enum CodingKeys: String, CodingKey {
        case type = "_type"
        case link, title
    }
}
