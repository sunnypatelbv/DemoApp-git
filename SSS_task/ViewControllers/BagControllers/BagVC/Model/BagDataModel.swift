//
//  BagDataModel.swift
//  SSS_task
//
//  Created by Sunny Patel on 30/11/23.
//

import Foundation
struct BagDataModel{
    var isLabel: Bool
    var isCustomCell: Bool
    var cellType: BagCellDataType
}

enum BagCellDataType{
    case freeDelivery
    case totalSaving
    case cartProduct
    case emi
    case orderSummary
}
