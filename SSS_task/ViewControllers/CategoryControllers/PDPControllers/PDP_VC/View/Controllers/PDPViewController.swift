//
//  PDPViewController.swift
//  SSS_task
//
//  Created by Sunny Patel on 03/10/23.
//

import UIKit

class PDPViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Variables
    var pdpViewModel = PDPViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "ProductPreviewTableCell", bundle: nil), forCellReuseIdentifier: "ProductPreviewTableCell")
        tableView.register(UINib(nibName: "ProductColourCell", bundle: nil), forCellReuseIdentifier: "ProductColourCell")
        tableView.register(UINib(nibName: "ProductDescriptionCell", bundle: nil), forCellReuseIdentifier: "ProductDescriptionCell")
        tableView.register(UINib(nibName: "ExpandableCell", bundle: nil), forCellReuseIdentifier: "ExpandableCell")
        tableView.register(UINib(nibName: "SizeOptionCell", bundle: nil), forCellReuseIdentifier: "SizeOptionCell")
        tableView.register(UINib(nibName: "SectionHeaderCell", bundle: nil), forCellReuseIdentifier: "SectionHeaderCell")
        tableView.register(UINib(nibName: "ProductCell", bundle: nil), forCellReuseIdentifier: "ProductCell")
        tableView.delegate = self
        tableView.dataSource = self
        pdpViewModel.delegate = self
        pdpViewModel.getData()
        // Do any additional setup after loading the view.
    }
}

//MARK: Extension
extension PDPViewController: PDPViewModelDelegate{
    func onFailure(error: Error?) {
        print(error?.localizedDescription)
    }
    
    func onSuccess() {
        self.tableView.reloadData()
    }
    
}









