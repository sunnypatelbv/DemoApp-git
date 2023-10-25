//
//  AccountOptionsModel.swift
//  SSS_task
//
//  Created by Sunny Patel on 29/09/23.
//

import Foundation

struct AccountOptionsModel{
    var isCollection: Bool
    var isBannerView: Bool
    var isTitle: Bool
    var identifier: AccountOption
}

enum AccountOption{
    case orderOptions
    case gamePointsBanner
    case funzone
    case accountHeader
    case accountOptions
    case helpHeader
    case helpOptions
}
