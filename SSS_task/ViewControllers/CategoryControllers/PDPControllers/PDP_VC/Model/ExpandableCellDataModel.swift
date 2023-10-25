//
//  ExpandableCellDataModel.swift
//  SSS_task
//
//  Created by Sunny Patel on 04/10/23.
//

import Foundation

struct ExpandableCellDataModel {
    let title: String
    var isExpanded = false
    
    static let mockedData: [ExpandableCellDataModel] = [
        ExpandableCellDataModel(title: ""),
        ExpandableCellDataModel(title: ""),
        ExpandableCellDataModel(title: ""),
        ExpandableCellDataModel(title: ""),
        ExpandableCellDataModel(title: "Product Details"),
        ExpandableCellDataModel(title: "Delivery Options"),
        ExpandableCellDataModel(title: "Terms and Conditions"),
        ExpandableCellDataModel(title: "Returns and Exchange"),
        ExpandableCellDataModel(title: ""),
        ExpandableCellDataModel(title: ""),
        ExpandableCellDataModel(title: ""),
        ExpandableCellDataModel(title: ""),
    ]
    
}



