//
//  JoinNowViewModel.swift
//  SSS_task
//
//  Created by Sunny Patel on 30/10/23.
//

import UIKit

class JoinNowViewModel{
    
    //MARK: Variables
    var dataArr = [
        RegistrationModel(isBtn: true, btnTitle: "Continue with Facebook", btnImage: "facebook", isLbl: false, lblText: "", isTextField: false, txtPlaceholder: "",txtFieldValue: "", error: "", isSecure: false, isOption: false, isLblWithCheckbox: false, isAttributedText: false, identifier: .facebook,validationType: .none),
        RegistrationModel(isBtn: true, btnTitle: "Continue with Google", btnImage: "google", isLbl: false, lblText: "", isTextField: false, txtPlaceholder: "",txtFieldValue: "", error: "", isSecure: false, isOption: false, isLblWithCheckbox: false, isAttributedText: false, identifier: .google,validationType: .none),
        RegistrationModel(isBtn: false, btnTitle: "", btnImage: "", isLbl: true, lblText: "Sign up with email address", isTextField: false, txtPlaceholder: "",txtFieldValue: "", error: "", isSecure: false, isOption: false, isLblWithCheckbox: false, isAttributedText: false, identifier: .orAndSignUpHeader,validationType: .none),
        RegistrationModel(isBtn: false, btnTitle: "", btnImage: "", isLbl: false, lblText: "Email", isTextField: true, txtPlaceholder: "Email",txtFieldValue: "", error: "", isSecure: false, isOption: false, isLblWithCheckbox: false, isAttributedText: false, identifier: .email,validationType: .email),
        RegistrationModel(isBtn: false, btnTitle: "", btnImage: "", isLbl: true, lblText: "", isTextField: false, txtPlaceholder: "",txtFieldValue: "", error: "", isSecure: false, isOption: false, isLblWithCheckbox: false, isAttributedText: false, identifier: .useMobileNumber,validationType: .none),
        RegistrationModel(isBtn: false, btnTitle: "", btnImage: "", isLbl: false, lblText: "First Name", isTextField: false, txtPlaceholder: "First Name",txtFieldValue: "", error: "", isSecure: false, isOption: false, isLblWithCheckbox: false, isAttributedText: false, identifier: .firstName,validationType: .name),
        RegistrationModel(isBtn: false, btnTitle: "", btnImage: "", isLbl: false, lblText: "Last Name", isTextField: false, txtPlaceholder: "Last Name",txtFieldValue: "", error: "", isSecure: false, isOption: false, isLblWithCheckbox: false, isAttributedText: false, identifier: .lastname,validationType: .name),
        RegistrationModel(isBtn: false, btnTitle: "", btnImage: "", isLbl: false, lblText: "Password", isTextField: false, txtPlaceholder: "Password",txtFieldValue: "", error: "", isSecure: true, isOption: false, isLblWithCheckbox: false, isAttributedText: false, identifier: .password,validationType: .password),
        RegistrationModel(isBtn: false, btnTitle: "", btnImage: "", isLbl: false, lblText: "Confirm Password", isTextField: false, txtPlaceholder: "Confirm Password",txtFieldValue: "", error: "", isSecure: true, isOption: false, isLblWithCheckbox: false, isAttributedText: false, identifier: .confirmPass,validationType: .password),
        RegistrationModel(isBtn: false, btnTitle: "", btnImage: "", isLbl: false, lblText: "", isTextField: false, txtPlaceholder: "",txtFieldValue: "", error: "", isSecure: false, isOption: true, isLblWithCheckbox: false, isAttributedText: false, identifier: .gender,validationType: .none),
        RegistrationModel(isBtn: false, btnTitle: "", btnImage: "", isLbl: false, lblText: "Sign up to receive latest updates from Sun & Sand Sports", isTextField: false, txtPlaceholder: "",txtFieldValue: "", error: "", isSecure: false, isOption: false, isLblWithCheckbox: true, isAttributedText: false, identifier: .receiveUpdates,validationType: .none),
        RegistrationModel(isBtn: true, btnTitle: "Create Account", btnImage: "", isLbl: false, lblText: "", isTextField: false, txtPlaceholder: "",txtFieldValue: "", error: "", isSecure: false, isOption: false, isLblWithCheckbox: false, isAttributedText: false, identifier: .createAccount,validationType: .none),
        RegistrationModel(isBtn: false, btnTitle: "", btnImage: "", isLbl: false, lblText: "", isTextField: false, txtPlaceholder: "",txtFieldValue: "", error: "", isSecure: false, isOption: false, isLblWithCheckbox: false, isAttributedText: true, identifier: .alreadyMember,validationType: .none)
    ]
    var isEmailCell = true
    var userLoggedin: Bool {
        UserDefaults.standard.bool(forKey: "isUserLoggedInUserDefault")
    }
}
