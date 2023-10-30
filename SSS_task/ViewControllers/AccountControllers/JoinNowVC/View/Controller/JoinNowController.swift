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
    var joinNowViewModel = JoinNowViewModel()
    
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
        cell.lblTitle.text = joinNowViewModel.dataArr[indexPath.row].btnTitle
        
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
        cell.lblTitle.text = joinNowViewModel.dataArr[indexPath.row].lblText
        return cell
    }
    
    
    func textFieldCell(model : RegistrationModel, tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FormFieldCell", for: indexPath) as? FormFieldCell else {return UITableViewCell()}
        cell.tftText = { [weak self] value in
            self?.joinNowViewModel.dataArr[indexPath.row].txtFieldValue = value

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
        if joinNowViewModel.isEmailCell == true {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FormFieldCell", for: indexPath) as? FormFieldCell else {return UITableViewCell()}
            cell.selectionStyle = .none
            cell.inputTxtField.placeholder = model.txtPlaceholder
            cell.inputTxtField.title = model.lblText
            cell.tftText = { [weak self] value in
                self?.joinNowViewModel.dataArr[indexPath.row].txtFieldValue = value
            }
            return cell
        }
        else if joinNowViewModel.isEmailCell == false {
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
        if joinNowViewModel.isEmailCell == true {
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






