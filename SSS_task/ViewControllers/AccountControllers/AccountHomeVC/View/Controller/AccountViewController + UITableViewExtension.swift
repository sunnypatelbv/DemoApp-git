//
//  AccountViewController + UITableViewExtension.swift
//  SSS_task
//
//  Created by Sunny Patel on 30/10/23.
//

import UIKit

//MARK:TableViewDelegate and TableViewDataSource
extension AccountViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if accountViewModel.userDefault {
            return accountViewModel.loggedinDataArr.count
        }
        else {
            return accountViewModel.dataArr.count
        }
        //        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var model : AccountOptionsModel?
        if accountViewModel.userDefault {
            model = accountViewModel.loggedinDataArr[indexPath.row]
        }
        else {
            model = accountViewModel.dataArr[indexPath.row]
        }
        switch model?.identifier {
        case .orderOptions:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "AccountOptionsViewCell", for: indexPath) as? AccountOptionsViewCell {
                cell.changeVC = { [weak self] value in
                    if value == "Orders"{
                        guard let objVC = self?.storyboard?.instantiateViewController(identifier: "OrdersViewController") as? OrdersViewController else {return}
                        self?.navigationController?.pushViewController(objVC, animated: true)
                    }else if value ==  "Stores"{
                        guard let objVC = self?.storyboard?.instantiateViewController(identifier: "StoresViewController") as? StoresViewController else {return}
                        self?.navigationController?.pushViewController(objVC, animated: true)
                    }else if value == "Settings"{
                        guard let objVC = self?.storyboard?.instantiateViewController(identifier: "SettingsViewController") as? SettingsViewController else {return}
                        self?.navigationController?.pushViewController(objVC, animated: true)
                    }
                }
                return cell
            }
        case .funzone:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "FunZoneTableCell", for: indexPath) as? FunZoneTableCell {
                return cell
            }
        case .helpHeader:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "GetHelpViewCell", for: indexPath) as? GetHelpViewCell {
                return cell
            }
        case .helpOptions:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "AppOptionsViewCell", for: indexPath) as? AppOptionsViewCell {
                return cell
            }
        case .gamePointsBanner:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "MySSSPointsCell", for: indexPath) as? MySSSPointsCell {
                return cell
            }
        case .accountHeader:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "GetHelpViewCell", for: indexPath) as? GetHelpViewCell {
                cell.label.text = "My Account"
                return cell
            }
        case .accountOptions:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "AppOptionsViewCell", for: indexPath) as? AppOptionsViewCell {
                return cell
            }
        case .none:
            return UITableViewCell()
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CustomTableHeaderView") as? CustomTableHeaderView {
            headerView.completionHandler = { [weak self] value in
                if value == "signin" {
                    guard let objVC = self?.storyboard?.instantiateViewController(identifier: "JoinNowController") as? JoinNowController else {return}
                    self?.navigationController?.pushViewController(objVC, animated: true)
                }
                else if value == "login"{
                    guard let objVC = self?.storyboard?.instantiateViewController(identifier: "LoginController") as? LoginController else {return}
                    self?.navigationController?.pushViewController(objVC, animated: true)
                }
            }
            return headerView
        }
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
