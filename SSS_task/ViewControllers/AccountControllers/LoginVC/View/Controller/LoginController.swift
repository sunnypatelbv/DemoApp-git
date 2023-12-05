//
//  SigninController.swift
//  SSS_task
//
//  Created by Sunny Patel on 21/09/23.
//

import UIKit

class LoginController: UIViewController {
    
    //MARK:IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    //MARK:Variables
    var loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "FormFieldCell", bundle: nil), forCellReuseIdentifier: "FormFieldCell")
        tableView.register(UINib(nibName: "ForgotPasswordCell", bundle: nil), forCellReuseIdentifier: "ForgotPasswordCell")
        tableView.register(UINib(nibName: "UseMobileNumberCell", bundle: nil), forCellReuseIdentifier: "UseMobileNumberCell")
        tableView.register(UINib(nibName: "RegistrationBtnCell", bundle: nil), forCellReuseIdentifier: "RegistrationBtnCell")
        tableView.register(UINib(nibName: "SignupEmailCell", bundle: nil), forCellReuseIdentifier: "SignupEmailCell")
        tableView.register(UINib(nibName: "NewCustomerCell", bundle: nil), forCellReuseIdentifier: "NewCustomerCell")
        tableView.register(UINib(nibName: "LoginWithNumberCell", bundle: nil), forCellReuseIdentifier: "LoginWithNumberCell")
        tableView.register(UINib(nibName: "SubmitButtonCell", bundle: nil), forCellReuseIdentifier: "SubmitButtonCell")
        
        navigationController?.navigationBar.isHidden = false
        
        // Do any additional setup after loading the view.
    }
    
    //MARK: Functions
    
    func showAlert(_ name: String){
        
        let alert = UIAlertController(title: "Welcome \(name)", message: "Login Successful", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: backtoHome))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showError(){
        
        let alert = UIAlertController(title: "Invalid Credentials", message: "Please check email or password", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func backtoHome(action: UIAlertAction){
        print("action performed")
        loginViewModel.closure?(true, loginViewModel.name)
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func checkValidation() {
        print("checking validation")
        if loginViewModel.loginValidationObj.validateEmail(loginViewModel.dataArr[0].txtFieldValue) && loginViewModel.loginValidationObj.validatePassword(loginViewModel.dataArr[2].txtFieldValue){
            print("validation succesful")
            
            //Declare Variables
            let email = loginViewModel.dataArr[0].txtFieldValue
            let password = loginViewModel.dataArr[2].txtFieldValue
            let loginString = String(format: "%@:%@", email, password)
            print(loginString)
            let loginData = loginString.data(using: String.Encoding.utf8)!
            print(loginData)
            let base64LoginString = loginData.base64EncodedString()
            print(base64LoginString)
            UserDefaults.standard.set(base64LoginString, forKey: "basicKey")
            var components = URLComponents()
            components.scheme = "https"
            components.host = "ov-dev.sssports.com"
            components.path = "/s/UAE/dw/shop/v20_10/customers/auth"
            components.queryItems = [
                URLQueryItem(name: "locale", value: "en-AE"),
                URLQueryItem(name: "client_id", value: "ce6abb4e-faf1-41af-94e7-feb1e2dd4a77")
            ]
            guard let url = components.url else {return}
            let parameters = [
                "type": "credentials"
            ] as? [String : Any]
            guard let basic = UserDefaults.standard.string(forKey: "basicKey") else {return}
            let header = [
                "Authorization" : "Basic \(basic)"
            ]
            print(basic)
            APIManager.shared.postRequest(url: url.absoluteString, body: parameters, httpHeaders: header, type: LoginResponseData.self) { (data, response, error) in
                print(url)
                let response = (response as! HTTPURLResponse)
                if response.statusCode == 200{
                    DispatchQueue.main.async {
                        
                        self.showAlert(data?.firstName ?? "")
                        if let name = data?.firstName {
                            UserDefaults.standard.set(name, forKey: "UserName")
                        }
                        self.loginViewModel.name = data?.firstName! ?? ""
                        UserDefaults.standard.set(true, forKey: "isUserLoggedInUserDefault")
                        guard let tokenStr = response.allHeaderFields["Authorization"] else {return}
                        UserDefaults.standard.set(response.allHeaderFields["Authorization"], forKey: "authToken")
                        UserDefaults.standard.data(forKey: "authToken")
//                        UserDefaults.standard.set("30e268d2d37fdc2e160c88efc0", forKey: "basketID")
                        UserDefaults.standard.set(tokenStr, forKey: "authToken")
                        self.getBasketData()
                    }
                }
                else if response.statusCode == 401{
                    DispatchQueue.main.async {
                        self.showError()
                    }

                }
            }

        } else{
            print("invalid")
        }
        
    }
    
    //https://ov-dev.sssports.com/s/UAE/dw/shop/v20_10/customers/bcbpcY1HgG9oyITnupOjaFha8w/baskets?locale=en-AE
    
    func getBasketData(){
        var components = URLComponents()
        components.scheme = "https"
        components.host = "ov-dev.sssports.com"
        components.path = "/s/UAE/dw/shop/v20_10/customers/bcbpcY1HgG9oyITnupOjaFha8w/baskets"
        components.queryItems = [
            URLQueryItem(name: "locale", value: "en-AE")
        ]
        guard let url = components.url else {return}
        guard let token = UserDefaults.standard.string(forKey: "authToken") else {return}
        let header = [
            "Authorization" : "\(token)"
        ]
        APIManager.shared.fetchData(pageUrl: url.absoluteString, httpHeaders: header, dataModel: BasketDataModel.self) { (data, response, error) in
            let response = (response as! HTTPURLResponse)
            print(error?.localizedDescription)
            guard let data = data, error == nil else {return}
            
            if response.statusCode == 200 {
                print(data.baskets?[0].basketID)
                guard let basket_id = data.baskets?[0].basketID  else {return}
                if basket_id != nil{
                    print(basket_id)
                }
                else {
                    self.createBasket()
                }
            }
        }
        
    }
    
    func createBasket(){
        print("Creating new basket")
        var components = URLComponents()
        components.scheme = "https"
        components.host = "ov-dev.sssports.com"
        components.path = "/s/UAE/dw/shop/v20_10/customers/bcbpcY1HgG9oyITnupOjaFha8w/baskets"
        components.queryItems = [
            URLQueryItem(name: "locale", value: "en-AE")
        ]
        guard let url = components.url else {return}
        guard let token = UserDefaults.standard.string(forKey: "authToken") else {return}
        let header = [
            "Authorization" : "\(token)"
        ]
    }
    
    
    func textFieldCell(model : RegistrationModel, tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FormFieldCell", for: indexPath) as? FormFieldCell else {return UITableViewCell()}
        cell.selectionStyle = .none
        switch model.identifier{
        case .password:
            cell.inputTxtField.placeholder = model.txtPlaceholder
            cell.inputTxtField.title = model.lblText
            cell.inputTxtField.isSecureTextEntry = true
            cell.tftText = { [weak self] value in
                self?.loginViewModel.dataArr[indexPath.row].txtFieldValue = value
            }
        default :
            return UITableViewCell()
        }
        return cell
    }
    
    func mainLoginField(model : RegistrationModel, tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if loginViewModel.isEmailCell == true {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FormFieldCell", for: indexPath) as? FormFieldCell else {return UITableViewCell()}
            cell.selectionStyle = .none
            cell.inputTxtField.placeholder = model.txtPlaceholder
            cell.inputTxtField.title = model.lblText
            cell.tftText = { [weak self] value in
                self?.loginViewModel.dataArr[indexPath.row].txtFieldValue = value
                //                print(self!.dataArr[indexPath.row].txtFieldValue)
            }
            return cell
        }
        else if loginViewModel.isEmailCell == false {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "LoginWithNumberCell", for: indexPath) as? LoginWithNumberCell else {return UITableViewCell()}
            return cell
        }
        return UITableViewCell()
    }
    
    func forgotPasswordCell(model : RegistrationModel, tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ForgotPasswordCell", for: indexPath) as? ForgotPasswordCell else {return UITableViewCell()}
        cell.goToForgot = { [weak self] value in
            if value == "forgot"{
                guard let objVC = self?.storyboard?.instantiateViewController(identifier: "ForgotPasswordController") as? ForgotPasswordController else {return}
                self?.navigationController?.pushViewController(objVC, animated: true)
            }
            
        }
        cell.selectionStyle = .none
        cell.forgotBtn.setTitle("\(model.btnTitle)", for: .normal)
        return cell
    }
    
    func createAccCell(model : RegistrationModel, tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SubmitButtonCell", for: indexPath) as? SubmitButtonCell else { return UITableViewCell()}
        cell.selectionStyle = .none
        cell.submitBtn.layer.cornerRadius = 12
        cell.submitBtn.setTitle(model.btnTitle, for: .normal)
        cell.closure = { [weak self] value in
            if value == true{
                self?.checkValidation()
            }
        }
        return cell
    }
    
    func useMobileNumber(model : RegistrationModel, tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if loginViewModel.isEmailCell == true {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "UseMobileNumberCell", for: indexPath) as? UseMobileNumberCell else { return UITableViewCell()}
            cell.label.text = "Use your mobile number instead"
            cell.selectionStyle = .none
            return cell
        }else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "UseMobileNumberCell", for: indexPath) as? UseMobileNumberCell else { return UITableViewCell()}
            cell.label.text = "Use your email address instead"
            cell.selectionStyle = .none
            return cell
        }
        
    }
    
    
    func orlabelCell(model : RegistrationModel, tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SignupEmailCell", for: indexPath) as? SignupEmailCell else {return UITableViewCell()}
        cell.selectionStyle = .none
        cell.lblTitle.isHidden = true
        return cell
    }
    
    func socialCell(model : RegistrationModel, tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RegistrationBtnCell", for: indexPath) as? RegistrationBtnCell else { return UITableViewCell()}
        cell.selectionStyle = .none
        cell.viewForItem.layer.borderWidth = 2
        cell.viewForItem.layer.borderColor = UIColor.gray.cgColor
        cell.viewForItem.layer.cornerRadius = 12
        cell.lblTitle.text = loginViewModel.dataArr[indexPath.row].btnTitle
        
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
    
    func newCustomerCell(model : RegistrationModel, tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewCustomerCell", for: indexPath) as? NewCustomerCell else {return UITableViewCell()}
        cell.goToSignin = { [weak self] value in
            if value == "signin"{
                guard let objVC = self?.storyboard?.instantiateViewController(identifier: "JoinNowController") as? JoinNowController else {return}
                self?.navigationController?.pushViewController(objVC, animated: true)
            }
        }
        return cell
    }
}


