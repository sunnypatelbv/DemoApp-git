//
//  LoginController + UITableViewExtension.swift
//  SSS_task
//
//  Created by Sunny Patel on 30/10/23.
//

import UIKit

extension LoginController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return loginViewModel.dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = loginViewModel.dataArr[indexPath.row]
        
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
        let model = loginViewModel.dataArr[indexPath.row]
        if model.identifier == .useMobileNumber{
            if loginViewModel.isEmailCell == false {
                loginViewModel.isEmailCell = true
            }else {
                loginViewModel.isEmailCell = false
            }
            tableView.reloadData()
        }
        
    }
}
