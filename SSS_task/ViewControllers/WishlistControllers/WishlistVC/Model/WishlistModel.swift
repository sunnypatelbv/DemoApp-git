// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let wishlistModel = try? JSONDecoder().decode(WishlistModel.self, from: jsonData)

import Foundation

// MARK: - WishlistModel
struct WishlistModel: Codable {
    let v, type: String?
    let count: Int?
    let data: [Datum]?
    let start, total: Int?

    enum CodingKeys: String, CodingKey {
        case v = "_v"
        case type = "_type"
        case count, data, start, total
    }
}

// MARK: - Datum
struct Datum: Codable {
    let type, creationDate, description: String?
    let event: Event?
    let id: String?
    let itemsLink: SLink?
    let lastModified, name: String?
    let datumPublic: Bool?
    let datumType: String?
    let customerProductListItems: [CustomerProductListItem]?

    enum CodingKeys: String, CodingKey {
        case type = "_type"
        case creationDate = "creation_date"
        case description, event, id
        case itemsLink = "items_link"
        case lastModified = "last_modified"
        case name
        case datumPublic = "public"
        case datumType = "type"
        case customerProductListItems = "customer_product_list_items"
    }
}

// MARK: - CustomerProductListItem
struct CustomerProductListItem: Codable {
    let type: CustomerProductListItemType?
    let id: String?
    let priority: Int?
    let productDetailsLink: SLink?
    let productID: String?
    let customerProductListItemPublic: Bool?
    let purchasedQuantity, quantity: Int?
    let customerProductListItemType: TypeEnum?

    enum CodingKeys: String, CodingKey {
        case type = "_type"
        case id, priority
        case productDetailsLink = "product_details_link"
        case productID = "product_id"
        case customerProductListItemPublic = "public"
        case purchasedQuantity = "purchased_quantity"
        case quantity
        case customerProductListItemType = "type"
    }
}

enum TypeEnum: String, Codable {
    case product = "product"
}

// MARK: - SLink
struct SLink: Codable {
    let type: ItemsLinkType?
    let link: String?
    let title: String?

    enum CodingKeys: String, CodingKey {
        case type = "_type"
        case link, title
    }
}

enum ItemsLinkType: String, Codable {
    case customerProductListItemLink = "customer_product_list_item_link"
    case productSimpleLink = "product_simple_link"
}

enum CustomerProductListItemType: String, Codable {
    case customerProductListItem = "customer_product_list_item"
}

// MARK: - Event
struct Event: Codable {
    let type: String?

    enum CodingKeys: String, CodingKey {
        case type = "_type"
    }
}
