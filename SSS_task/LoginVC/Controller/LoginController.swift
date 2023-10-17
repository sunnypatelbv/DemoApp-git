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
    
    var closure: ((Bool, String) -> ())?
    var name = ""
    var nameClosure: ((String) -> ())?
    var token = ""
    
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
        //        let vc = storyboard?.instantiateViewController(identifier: "AccountViewController") as! AccountViewController
        //        let vc = AccountViewController()
        //        vc.isUserLoggedin = true
        closure?(true, name)
        self.navigationController?.popViewController(animated: true)
        //        self.navigationController?.popViewController(animated: true)
        //        let controllers = self.navigationController?.viewControllers
        //        for vc in controllers! {
        //            if vc is AccountViewController {
        //
        //                self.navigationController?.popToViewController(vc, animated: true)
        //
        //
        //            }
        //        }
    }
    
    
    func checkValidation() {
        print("checking validation")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let passwordRegex = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{8,}$"
        let passwordPred = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        if emailPred.evaluate(with: dataArr[0].txtFieldValue) && passwordPred.evaluate(with: dataArr[2].txtFieldValue){
            print("validation succesful")
            
            //Declare Variables
            let email = dataArr[0].txtFieldValue
            let password = dataArr[2].txtFieldValue
            let loginString = String(format: "%@:%@", email, password)
            let loginData = loginString.data(using: String.Encoding.utf8)!
            let base64LoginString = loginData.base64EncodedString()
            
            
            //Declare URL
            guard let url = URL(string: "https://ov-dev.sssports.com/s/UAE/dw/shop/v20_10/customers/auth?locale=en-AE&client_id=ce6abb4e-faf1-41af-94e7-feb1e2dd4a77") else {return}
            
            //Declare request
            var request = URLRequest(url: url)
            
            //Method,Body and Headers
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
            request.setValue("redirectURL=https://en-kw.sssports.com/on/demandware.store/Sites-Kuwait-Site/en_KW/Account-OrderDetails?noLocaleRedirect=true&orderID=KW01265419&orderId=KW01265419&client_id=test", forHTTPHeaderField: "Cookie")
            let parameters: [String: AnyHashable] = [
                "type": "credentials"
            ]
            request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            
            //Make the request
            let task = URLSession.shared.dataTask(with: request){ data, response, error in
                guard let data = data, error == nil else {
                    return
                }
                let response = (response as! HTTPURLResponse)
                print(response.statusCode)
                do {
                    print(data)
                    let receivedData = try JSONDecoder().decode(LoginResponseData.self, from: data)
                    //                    let receivedData = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                    if response.statusCode == 200{
                        DispatchQueue.main.async {
                            print(response.allHeaderFields["Authorization"]!)
                            print(type(of: response.allHeaderFields["Authorization"]!))
                            self.showAlert(receivedData.firstName ?? "")
                            self.name = receivedData.firstName!
                            UserDefaults.standard.set(true, forKey: "isUserLoggedInUserDefault")
                            
                            guard let tokenStr = response.allHeaderFields["Authorization"] else {return}
                            UserDefaults.standard.set(response.allHeaderFields["Authorization"], forKey: "authToken")
                            UserDefaults.standard.data(forKey: "authToken")
                            UserDefaults.standard.set(tokenStr, forKey: "authToken")
                            print(tokenStr)
                        }
                    }
                    else if response.statusCode == 401{
                        DispatchQueue.main.async {
                            self.showError()
                        }
                        
                    }
                }
                catch {
                    print(error)
                }
            }
            task.resume()
            
            
        } else{
            print("invalid")
        }
        
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
                self?.dataArr[indexPath.row].txtFieldValue = value
                //                print(self!.dataArr[indexPath.row].txtFieldValue)
            }
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
                //                print(self!.dataArr[indexPath.row].txtFieldValue)
            }
            return cell
        }
        else if isEmailCell == false {
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
        //        cell.viewForItem.layer.borderWidth = 2
        //        cell.viewForItem.layer.borderColor = UIColor.gray.cgColor
        //        cell.viewForItem.layer.cornerRadius = 12
        //        cell.viewForItem.backgroundColor = .darkGray
        //        cell.lblTitle.textColor = .white
        //        cell.lblTitle.text = model.btnTitle
        cell.submitBtn.setTitle(model.btnTitle, for: .normal)
        cell.closure = { [weak self] value in
            if value == true{
                self?.checkValidation()
            }
        }
        return cell
    }
    
    func useMobileNumber(model : RegistrationModel, tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isEmailCell == true {
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

extension LoginController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = dataArr[indexPath.row]
        
        switch model.identifier{
        
        
        case .email:
            return mainLoginField(model: model, tableView: tableView, cellForRowAt: indexPath)
        case .password:
            return textFieldCell(model: model, tableView: tableView, cellForRowAt: indexPath)
        case .firstName:
            return forgotPasswordCell(model: model, tableView: tableView, cellForRowAt: indexPath)
        case .createAccount:
            return createAccCell(model: model, tableView: tableView, cellForRowAt: indexPath)
        case .orAndSignUpHeader:
            return orlabelCell(model: model, tableView: tableView, cellForRowAt: indexPath)
        case .facebook:
            return socialCell(model: model, tableView: tableView, cellForRowAt: indexPath)
        case .google:
            return socialCell(model: model, tableView: tableView, cellForRowAt: indexPath)
        case .alreadyMember:
            return newCustomerCell(model: model, tableView: tableView, cellForRowAt: indexPath)
        case .useMobileNumber:
            return useMobileNumber(model: model, tableView: tableView, cellForRowAt: indexPath)
        default:
            break
        }
        return UITableViewCell()
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
