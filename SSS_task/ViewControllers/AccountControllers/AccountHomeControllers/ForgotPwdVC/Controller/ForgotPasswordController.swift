//
//  ForgotPasswordController.swift
//  SSS_task
//
//  Created by Sunny Patel on 26/09/23.
//

import UIKit

class ForgotPasswordController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Variables
    var isEmailCell = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "TableLabelCell", bundle: nil), forCellReuseIdentifier: "TableLabelCell")
        tableView.register(UINib(nibName: "FormFieldCell", bundle: nil), forCellReuseIdentifier: "FormFieldCell")
        tableView.register(UINib(nibName: "UseMobileNumberCell", bundle: nil), forCellReuseIdentifier: "UseMobileNumberCell")
        tableView.register(UINib(nibName: "SubmitButtonCell", bundle: nil), forCellReuseIdentifier: "SubmitButtonCell")
        tableView.register(UINib(nibName: "BacktoSigninCell", bundle: nil), forCellReuseIdentifier: "BacktoSigninCell")
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
}

extension ForgotPasswordController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableLabelCell", for: indexPath) as? TableLabelCell else {return UITableViewCell()}
            cell.label.text = "Please enter your email address below to receive a password link"
            return cell
        }
        else if indexPath.row == 1{
            if isEmailCell == true {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "FormFieldCell", for: indexPath) as? FormFieldCell else {return UITableViewCell()}
                return cell
            }
            else if isEmailCell == false {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "LoginWithNumberCell", for: indexPath) as? LoginWithNumberCell else {return UITableViewCell()}
                return cell
            }
            return UITableViewCell()
        }
        else if indexPath.row == 2{
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
        else if indexPath.row == 3 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SubmitButtonCell", for: indexPath) as? SubmitButtonCell else {return UITableViewCell()}
            return cell
        }
        else if indexPath.row == 4{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "BacktoSigninCell", for: indexPath) as? BacktoSigninCell else {return UITableViewCell()}
            cell.goToSigin = { [weak self] value in
                if value == "signin"{
                    guard let objVC = self?.storyboard?.instantiateViewController(identifier: "LoginController") as? LoginController else {return}
                    self?.navigationController?.pushViewController(objVC, animated: true)
                }
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

