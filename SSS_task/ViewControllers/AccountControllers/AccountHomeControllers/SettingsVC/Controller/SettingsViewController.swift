//
//  SettingsViewController.swift
//  SSS_task
//
//  Created by Sunny Patel on 25/09/23.
//

import UIKit

class SettingsViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Variables
    var settingsArr = [
        "KSA: SAR",
    "العربية",
        "Category Preference"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "SettingsOptionCell", bundle: nil), forCellReuseIdentifier: "SettingsOptionCell")
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    


}

//MARK: Tableview Delegates and DataSource
extension SettingsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsOptionCell", for: indexPath) as? SettingsOptionCell else {return UITableViewCell()}
        cell.settingsLbl.text = settingsArr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}
