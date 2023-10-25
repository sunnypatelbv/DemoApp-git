//
//  OrdersViewController.swift
//  SSS_task
//
//  Created by Sunny Patel on 25/09/23.
//

import UIKit

class OrdersViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Variables
    var placeHoldersArr = [
        "Order no (i.e. 0123456789",
        "Phone Number"
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "FormFieldCell", bundle: nil), forCellReuseIdentifier: "FormFieldCell")
        tableView.register(UINib(nibName: "LoginWithNumberCell", bundle: nil), forCellReuseIdentifier: "LoginWithNumberCell")
        tableView.register(UINib(nibName: "SubmitButtonCell", bundle: nil), forCellReuseIdentifier: "SubmitButtonCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    
}

//MARK: UITableView Delegates and DataSource
extension OrdersViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FormFieldCell", for: indexPath) as? FormFieldCell else {return UITableViewCell()}
            cell.inputTxtField.placeholder = placeHoldersArr[indexPath.row]
            return cell
        }
        else if indexPath.row == 1{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "LoginWithNumberCell", for: indexPath) as? LoginWithNumberCell else {return UITableViewCell()}
            return cell
        }
        else if indexPath.row == 2{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SubmitButtonCell", for: indexPath) as? SubmitButtonCell else {return UITableViewCell()}
            cell.submitBtn.setTitle("Track Order", for: .normal)
            cell.submitBtn.layer.cornerRadius = 8
            return cell
        }
        return UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
