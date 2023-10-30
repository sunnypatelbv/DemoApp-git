//
//  ViewController.swift
//  SSS_task
//
//  Created by Sunny Patel on 20/09/23.
//

import UIKit

class AccountViewController: UIViewController {
    
    //MARK: IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    var userDefault: Bool {
        UserDefaults.standard.bool(forKey: "isUserLoggedInUserDefault")
    }
//    let userDefault =
    //MARK: Variables
    var loggedinDataArr  = [ AccountOptionsModel(isCollection: true, isBannerView: false, isTitle: false,                   identifier: .orderOptions),
                             AccountOptionsModel(isCollection: false, isBannerView: true, isTitle: false, identifier: .gamePointsBanner),
                             AccountOptionsModel(isCollection: false, isBannerView: true, isTitle: false, identifier: .funzone),
                             AccountOptionsModel(isCollection: false, isBannerView: false, isTitle: true, identifier: .accountHeader),
                             AccountOptionsModel(isCollection: true, isBannerView: false, isTitle: false, identifier: .accountOptions),
                             AccountOptionsModel(isCollection: false, isBannerView: false, isTitle: true, identifier: .helpHeader),
                             AccountOptionsModel(isCollection: true, isBannerView: false, isTitle: false, identifier: .helpOptions)
    ]
    
    var dataArr = [
        AccountOptionsModel(isCollection: true, isBannerView: false, isTitle: false,identifier: .orderOptions),
        AccountOptionsModel(isCollection: false, isBannerView: true, isTitle: false, identifier: .funzone),
        AccountOptionsModel(isCollection: false, isBannerView: false, isTitle: true, identifier: .helpHeader),
        AccountOptionsModel(isCollection: true, isBannerView: false, isTitle: false, identifier: .helpOptions)
    ]
    
    //isUserLoggedInDefault
    
    public var isUserLoggedin = false
    var userName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CustomTableHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "CustomTableHeaderView")
        tableView.register(UINib(nibName: "AccountOptionsViewCell", bundle: nil), forCellReuseIdentifier: "AccountOptionsViewCell")
        tableView.register(UINib(nibName: "FunZoneTableCell", bundle: nil), forCellReuseIdentifier: "FunZoneTableCell")
        tableView.register(UINib(nibName: "AppOptionsViewCell", bundle: nil), forCellReuseIdentifier: "AppOptionsViewCell")
        tableView.register(UINib(nibName: "GetHelpViewCell", bundle: nil), forCellReuseIdentifier: "GetHelpViewCell")
        tableView.register(UINib(nibName: "MySSSPointsCell", bundle: nil), forCellReuseIdentifier: "MySSSPointsCell")
        self.navigationController?.navigationBar.isHidden = true
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        tableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
}

//MARK:TableViewDelegate and TableViewDataSource
extension AccountViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if userDefault {
            return loggedinDataArr.count
        }
        else {
            return dataArr.count
        }
        //        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var model : AccountOptionsModel?
        if userDefault {
            model = loggedinDataArr[indexPath.row]
        }
        else {
            model = dataArr[indexPath.row]
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


