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
    var pID = ""
    var refPID = ""
    
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
        pdpViewModel.getData(id: pID)
        print(pID)
        // Do any additional setup after loading the view.
    }
    
//    https://ov-dev.sssports.com/s/UAE/dw/shop/v20_10/baskets/30e268d2d37fdc2e160c88efc0/items
    //MARK: IBOutlets
    @IBAction func addToCartBtnTapped(_ sender: UIButton){
        print("** 🟢🟢🟢 Adding product to cart 🟢🟢🟢 **")
        var components = URLComponents()
        components.scheme = "https"
        components.host = "ov-dev.sssports.com"
        components.path = "/s/UAE/dw/shop/v20_10/baskets/30e268d2d37fdc2e160c88efc0/items"
    guard let url = components.url else {return}
    print(url)
        let params = [[
            "product_id": "194272271937",
            "quantity": 1
        ]] as [[String : Any]]
        print(params)
        print(refPID)
        guard let token = UserDefaults.standard.string(forKey: "authToken") else {return}
        let header = [
            "Authorization": token
        ]
        print(token)
        print(header)
        APIManager.shared.postRequest(url: "\(url)", bodyDict: params, httpHeaders: header, type: AddToCartModel.self) { (data, response, error) in
            print(url)
            guard let data = data, error == nil else {return}
            if let response = response as? HTTPURLResponse{
                if response.statusCode == 200 {
                    
                    print("🟢🟢🟢Item added to cart🟢🟢🟢")
                }
            }
        }
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









