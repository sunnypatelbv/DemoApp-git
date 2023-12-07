//
//  IconsModel.swift
//  SSS_task
//
//  Created by Sunny Patel on 25/09/23.
//

import Foundation

struct IconsModel{
    var iconTitle: String
    var iconImgName: String
    var identifier: IconType
}

enum IconType{
    case order
    case store
    case setting
    case livechat
    case contact
    case faq
    case policy
    case returns
    case payment
    case address
    case profile
}
