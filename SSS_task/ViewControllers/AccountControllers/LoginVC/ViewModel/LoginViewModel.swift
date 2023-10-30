//
//  LoginViewModel.swift
//  SSS_task
//
//  Created by Sunny Patel on 30/10/23.
//

import Foundation

class LoginViewModel{
    
    //MARK: Variables
    var dataArr = [
        RegistrationModel(isBtn: false, btnTitle: "", btnImage: "", isLbl: false, lblText: "Email", isTextField: true, txtPlaceholder: "Email",txtFieldValue: "", error: "", isSecure: false, isOption: false, isLblWithCheckbox: false, isAttributedText: false, identifier: .email,validationType: .email ),
        RegistrationModel(isBtn: false, btnTitle: "", btnImage: "", isLbl: true, lblText: "", isTextField: false, txtPlaceholder: "",txtFieldValue: "", error: "", isSecure: false, isOption: false, isLblWithCheckbox: false, isAttributedText: false, identifier: .useMobileNumber, validationType: .none),
        RegistrationModel(isBtn: false, btnTitle: "", btnImage: "", isLbl: false, lblText: "Password", isTextField: true, txtPlaceholder: "Password",txtFieldValue: "", error: "", isSecure: true, isOption: false, isLblWithCheckbox: false, isAttributedText: false, identifier: .password,validationType: .password ),
        RegistrationModel(isBtn: true, btnTitle: "Forgot your password?", btnImage: "", isLbl: false, lblText: "", isTextField: false, txtPlaceholder: "", txtFieldValue: "", error: "", isSecure: false, isOption: false, isLblWithCheckbox: false, isAttributedText: false, identifier: .firstName,validationType: .none ),
        RegistrationModel(isBtn: true, btnTitle: "Signin", btnImage: "", isLbl: false, lblText: "", isTextField: false, txtPlaceholder: "",txtFieldValue: "", error: "", isSecure: false, isOption: false, isLblWithCheckbox: false, isAttributedText: false, identifier: .createAccount,validationType: .none ),
        RegistrationModel(isBtn: false, btnTitle: "", btnImage: "", isLbl: true, lblText: "Sign up with email address", isTextField: false, txtPlaceholder: "",txtFieldValue: "", error: "", isSecure: false, isOption: false, isLblWithCheckbox: false, isAttributedText: false, identifier: .orAndSignUpHeader,validationType: .none ),
        RegistrationModel(isBtn: true, btnTitle: "Continue with Facebook", btnImage: "facebook", isLbl: false, lblText: "", isTextField: false, txtPlaceholder: "",txtFieldValue: "", error: "", isSecure: false, isOption: false, isLblWithCheckbox: false, isAttributedText: false, identifier: .facebook,validationType: .none ),
        RegistrationModel(isBtn: true, btnTitle: "Continue with Google", btnImage: "google", isLbl: false, lblText: "", isTextField: false, txtPlaceholder: "",txtFieldValue: "", error: "", isSecure: false, isOption: false, isLblWithCheckbox: false, isAttributedText: false, identifier: .google,validationType: .none ),
        RegistrationModel(isBtn: false, btnTitle: "", btnImage: "", isLbl: false, lblText: "", isTextField: false, txtPlaceholder: "",txtFieldValue: "", error: "", isSecure: false, isOption: false, isLblWithCheckbox: false, isAttributedText: true, identifier: .alreadyMember,validationType: .none )
        
    ]
    var isEmailCell = true
    var loginValidationObj = Validation()
    var closure: ((Bool, String) -> ())?
    var name = ""
    var nameClosure: ((String) -> ())?
    var token = ""
//    let url = "https://ov-dev.sssports.com/s/UAE/dw/shop/v20_10/customers/auth?locale=en-AE&client_id=ce6abb4e-faf1-41af-94e7-feb1e2dd4a77"
//    let parameters = [
//        "type": "credentials"
//    ]
//
//    func postLogin(){
//        APIManager.shared.postRequest(url: url, params: parameters, type: LoginResponseData.self) { [weak self] (data, error) in
//            if let data = data{
//                print(data)
//            } else {
//                print(error?.localizedDescription)
//            }
//        }
//    }
}
