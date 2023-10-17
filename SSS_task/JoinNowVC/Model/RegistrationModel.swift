//
//  RegistrationModel.swift
//  SSS_task
//
//  Created by Sunny Patel on 21/09/23.
//

import UIKit

struct RegistrationModel{
    var isBtn: Bool
    var btnTitle: String
    var btnImage: String
    var isLbl: Bool
    var lblText: String
    var isTextField: Bool
    var txtPlaceholder: String
    var txtFieldValue: String
    var error: String
    var isSecure: Bool
    var isOption: Bool
    var isLblWithCheckbox: Bool
    var isAttributedText: Bool
    var identifier: RegistrationCell
    var validationType: ValidationType
}

enum RegistrationCell {
    case facebook
    case google
    case orAndSignUpHeader
    case email
    case useMobileNumber
    case firstName
    case lastname
    case password
    case confirmPass
    case gender
    case receiveUpdates
    case createAccount
    case alreadyMember
}

enum ValidationType{
    case name
    case email
    case password
    case phone
    case none
}

