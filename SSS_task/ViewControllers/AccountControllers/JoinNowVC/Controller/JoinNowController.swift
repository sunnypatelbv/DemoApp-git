//
//  JoinNowController.swift
//  SSS_task
//
//  Created by Sunny Patel on 21/09/23.
//

import UIKit

class JoinNowController: UIViewController {
    
    //MARK: IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "RegistrationBtnCell", bundle: nil), forCellReuseIdentifier: "RegistrationBtnCell")
        tableView.register(UINib(nibName: "SignupEmailCell", bundle: nil), forCellReuseIdentifier: "SignupEmailCell")
        tableView.register(UINib(nibName: "FormFieldCell", bundle: nil), forCellReuseIdentifier: "FormFieldCell")
        tableView.register(UINib(nibName: "UseMobileNumberCell", bundle: nil), forCellReuseIdentifier: "UseMobileNumberCell")
        tableView.register(UINib(nibName: "GenderCell", bundle: nil), forCellReuseIdentifier: "GenderCell")
        tableView.register(UINib(nibName: "ReceiveMailCell", bundle: nil), forCellReuseIdentifier: "ReceiveMailCell")
        tableView.register(UINib(nibName: "AlreadyMemberCell", bundle: nil), forCellReuseIdentifier: "AlreadyMemberCell")
        tableView.register(UINib(nibName: "LoginWithNumberCell", bundle: nil), forCellReuseIdentifier: "LoginWithNumberCell")
        navigationController?.navigationBar.isHidden = false
        
        // Do any additional setup after loading the view.
    }
    
    
    //MARK: Functions
    func socialCell(model : RegistrationModel, tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RegistrationBtnCell", for: indexPath) as? RegistrationBtnCell else { return UITableViewCell()}
        cell.lblTitle.text = dataArr[indexPath.row].btnTitle
        
        switch model.identifier {
        case .facebook:
            cell.viewForItem.backgroundColor = .link
            cell.img.image = UIImage(named: "facebook.png")
            cell.lblTitle.textColor = .white
        case .google:
            cell.viewForItem.backgroundColor = .white
            cell.img.image = UIImage(named: "google.png")
            cell.lblTitle.textColor = .gray
        default:
            return UITableViewCell()
        }
        return cell
    }
    
    func orEmailCell(model : RegistrationModel, tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SignupEmailCell", for: indexPath) as? SignupEmailCell else {return UITableViewCell()}
        cell.lblTitle.text = dataArr[indexPath.row].lblText
        return cell
    }
    
    
    func textFieldCell(model : RegistrationModel, tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FormFieldCell", for: indexPath) as? FormFieldCell else {return UITableViewCell()}
        cell.tftText = { [weak self] value in
            self?.dataArr[indexPath.row].txtFieldValue = value

        }
        switch model.identifier{
        case .firstName:
            cell.inputTxtField.placeholder = model.txtPlaceholder
            cell.inputTxtField.title = model.lblText
        case .lastname:
            cell.inputTxtField.placeholder = model.txtPlaceholder
            cell.inputTxtField.title = model.lblText
        case .password:
            cell.inputTxtField.placeholder = model.txtPlaceholder
            cell.inputTxtField.title = model.lblText
            cell.inputTxtField.isSecureTextEntry = true
        case .confirmPass:
            cell.inputTxtField.placeholder = model.txtPlaceholder
            cell.inputTxtField.title = model.lblText
            cell.inputTxtField.isSecureTextEntry = true
        default :
            return UITableViewCell()
        }
        return cell
    }
    
    
    func mainLoginField(model : RegistrationModel, tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isEmailCell == true {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FormFieldCell", for: indexPath) as? FormFieldCell else {return UITableViewCell()}
            cell.selectionStyle = .none
            cell.inputTxtField.placeholder = model.txtPlaceholder
            cell.inputTxtField.title = model.lblText
            cell.tftText = { [weak self] value in
                self?.dataArr[indexPath.row].txtFieldValue = value
            }
            return cell
        }
        else if isEmailCell == false {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "LoginWithNumberCell", for: indexPath) as? LoginWithNumberCell else {return UITableViewCell()}
            return cell
        }
        return UITableViewCell()
    }

    
    func genderCell(model : RegistrationModel, tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GenderCell", for: indexPath) as? GenderCell else {return UITableViewCell()}
        return cell
    }
    
    func updatesCell(model : RegistrationModel, tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReceiveMailCell", for: indexPath) as? ReceiveMailCell else {return UITableViewCell()}
        cell.lblTitle.text = model.lblText
        return cell
    }
    
    func createAccCell(model : RegistrationModel, tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RegistrationBtnCell", for: indexPath) as? RegistrationBtnCell else { return UITableViewCell()}
        
        cell.lblTitle.text = model.btnTitle
        return cell
    }
    func useMobileNumber(model : RegistrationModel, tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isEmailCell == true {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "UseMobileNumberCell", for: indexPath) as? UseMobileNumberCell else { return UITableViewCell()}
            cell.label.text = "Use your mobile number instead"
            return cell
        }else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "UseMobileNumberCell", for: indexPath) as? UseMobileNumberCell else { return UITableViewCell()}
            cell.label.text = "Use your email address instead"
            return cell
        }
    }
    
    func alreadyCell(model : RegistrationModel, tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AlreadyMemberCell", for: indexPath) as? AlreadyMemberCell else {return UITableViewCell()}
        cell.selectionStyle = .none
        cell.goToLogin = { [weak self] value in
            if value == "login"{
                guard let objVC = self?.storyboard?.instantiateViewController(identifier: "LoginController") as? LoginController else {return}
                self?.navigationController?.pushViewController(objVC, animated: true)
            }
        }
        return cell
    }
    
}

//MARK: UITableView Delegate and DataSource
extension JoinNowController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = dataArr[indexPath.row]
        
        switch model.identifier {
        case .facebook:
            return socialCell(model: model, tableView: tableView, cellForRowAt: indexPath)
        case .google:
            return socialCell(model: model, tableView: tableView, cellForRowAt: indexPath)
        case .orAndSignUpHeader:
            return orEmailCell(model: model, tableView: tableView, cellForRowAt: indexPath)
        case .firstName:
            return textFieldCell(model: model, tableView: tableView, cellForRowAt: indexPath)
        case .lastname:
            return textFieldCell(model: model, tableView: tableView, cellForRowAt: indexPath)
        case .email:
            return mainLoginField(model: model, tableView: tableView, cellForRowAt: indexPath)
        case .password:
            return textFieldCell(model: model, tableView: tableView, cellForRowAt: indexPath)
        case .confirmPass:
            return textFieldCell(model: model, tableView: tableView, cellForRowAt: indexPath)
        case .gender:
            return genderCell(model: model, tableView: tableView, cellForRowAt: indexPath)
        case .receiveUpdates:
            return updatesCell(model: model, tableView: tableView, cellForRowAt: indexPath)
        case .createAccount:
            return createAccCell(model: model, tableView: tableView, cellForRowAt: indexPath)
        case .alreadyMember:
            return alreadyCell(model: model, tableView: tableView, cellForRowAt: indexPath)
        case .useMobileNumber:
            return useMobileNumber(model: model, tableView: tableView, cellForRowAt: indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = dataArr[indexPath.row]
        if model.identifier == .useMobileNumber{
            if isEmailCell == false {
                isEmailCell = true
            }else {
                isEmailCell = false
            }
            tableView.reloadData()
        }
    }
    
    
}




