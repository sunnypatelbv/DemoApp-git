//
//  PDPStringProtocol.swift
//  SSS_task
//
//  Created by Sunny Patel on 19/10/23.
//

import UIKit

extension StringProtocol {
    var html2AttributedString: NSAttributedString? {
        Data(utf8).html2AttributedString
    }
    var html2String: String {
        html2AttributedString?.string ?? ""
    }
}
