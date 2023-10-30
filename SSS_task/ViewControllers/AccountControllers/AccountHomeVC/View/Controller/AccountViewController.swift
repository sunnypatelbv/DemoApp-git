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
    
    //MARK: Variables
    var accountViewModel = AccountViewModel()
    
    
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



