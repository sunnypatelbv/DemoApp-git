//
//  LoginWithNumberCell.swift
//  SSS_task
//
//  Created by Sunny Patel on 25/09/23.
//

import UIKit
import SkyFloatingLabelTextField

class LoginWithNumberCell: UITableViewCell {
    
    //MARK: IBOutlets
    @IBOutlet weak var managerView: UIView!
    @IBOutlet weak var countryCodeView: UIView!
    @IBOutlet weak var mobileNumberTxt: SkyFloatingLabelTextField!
    
    //MARK: Variables
    var mobileValidObj = Validation()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mobileNumberTxt.tintColor = .red
        mobileNumberTxt.selectedTitleColor = .black
        // Initialization code
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        mobileNumberTxt.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        // Configure the view for the selected state
    }
    
    
}

extension LoginWithNumberCell: UITextFieldDelegate{
    @objc func textFieldDidChange(_ textfield: UITextField) {
        if let text = textfield.text {
            if let floatingLabelTextField = textfield as? SkyFloatingLabelTextField {
                
                if mobileValidObj.validateMobileNumber(text) {
                    floatingLabelTextField.errorMessage = ""
                } else {
                    floatingLabelTextField.errorMessage = "Invalid mobile number"
                }
            }
        }
    }
}
