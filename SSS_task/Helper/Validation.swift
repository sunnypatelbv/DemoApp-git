//
//  Validation.swift
//  SSS_task
//
//  Created by Sunny Patel on 19/10/23.
//

import Foundation

class Validation{
    
    
    func validateEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        if emailPred.evaluate(with: email){
            return true
        } else{
            return false
        }
    }
    
    
    func validatePassword(_ password: String) -> Bool {
        let passwordRegex = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{8,}$"
        let passwordPred = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        
        if passwordPred.evaluate(with: password){
            return true
        } else{
            return false
        }
    }
    
    func validateMobileNumber(_ number: String) -> Bool {
        let allowedCharacters = "^[0-9]{10}$"
        let allowedCharacterPred = NSPredicate(format : "SELF MATCHES %@", allowedCharacters)
        
        if allowedCharacterPred.evaluate(with: number){
            return true
        } else {
            return false
        }
    }
    
    
}
