//
//  FormFieldCell.swift
//  SSS_task
//
//  Created by Sunny Patel on 22/09/23.
//

import UIKit
import SkyFloatingLabelTextField

class FormFieldCell: UITableViewCell {
    
    //MARK: IBOutlet
    @IBOutlet weak var inputTxtField: SkyFloatingLabelTextField!
    //MARK: Variables
    var tftText: ((String) -> ())?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        inputTxtField.tintColor = .red
        inputTxtField.selectedTitleColor = .black
        inputTxtField.delegate = self
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        inputTxtField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        // Configure the view for the selected state
    }
    
}

//MARK: UITextFieldDelegate
extension FormFieldCell : UITextFieldDelegate{
    @objc func textFieldDidChange(_ textfield: UITextField) {
        
        if textfield.placeholder == "Email"{
            if let text = textfield.text {

                if let floatingLabelTextField = textfield as? SkyFloatingLabelTextField {
                    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
                    let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
                    if(emailPred.evaluate(with: text) == false) {
                        floatingLabelTextField.errorMessage = "Invalid email"
                    }
                    else {
                        // The error message will only disappear when we reset it to nil or empty string
                        floatingLabelTextField.errorMessage = ""
                    }
                }
            }
        }
        else if textfield.placeholder == "First Name" || textfield.placeholder == "Last Name"{
            if let text = textfield.text {
                if let floatingLabelTextField = textfield as? SkyFloatingLabelTextField {
                    if(text.count == 0) {
                        floatingLabelTextField.errorMessage = "Name cannot be empty"
                    }
                    else {
                        // The error message will only disappear when we reset it to nil or empty string
                        floatingLabelTextField.errorMessage = ""
                    }
                }
            }
        }
        else if textfield.placeholder == "Password" || textfield.placeholder ==  "Confirm Password"{
            if let text = textfield.text {
                if let floatingLabelTextField = textfield as? SkyFloatingLabelTextField {
                    let passwordRegex = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{8,}$"
                    if NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: text){
                        floatingLabelTextField.errorMessage = ""
                    }
                    else{
                        floatingLabelTextField.errorMessage = "Should contain 8, 1 Uppercase, 1 Lowercase and 1 Special charcter"
                    }
                }
            }
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? ""
        tftText?(text)
        return true
    }
}
