//
//  JoinNowController + UITableViewExtension.swift
//  SSS_task
//
//  Created by Sunny Patel on 30/10/23.
//

import UIKit

//MARK: UITableView Delegate and DataSource
extension JoinNowController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        joinNowViewModel.dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = joinNowViewModel.dataArr[indexPath.row]
        
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
        let model = joinNowViewModel.dataArr[indexPath.row]
        if model.identifier == .useMobileNumber{
            if joinNowViewModel.isEmailCell == false {
                joinNowViewModel.isEmailCell = true
            }else {
                joinNowViewModel.isEmailCell = false
            }
            tableView.reloadData()
        }
    }
    
    
}
