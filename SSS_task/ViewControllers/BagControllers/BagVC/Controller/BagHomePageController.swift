//
//  BagHomePageController.swift
//  SSS_task
//
//  Created by Sunny Patel on 27/09/23.
//

import UIKit

class BagHomePageController: UIViewController {
    
    //MARK: IBOutlet
    @IBOutlet weak var tableView: UITableView!

    //MARK: Variables
    var userLoggedin: Bool {
        UserDefaults.standard.bool(forKey: "isUserLoggedInUserDefault")
    }
    var dataArr = [
        BagDataModel(isLabel: true, isCustomCell: false, cellType: .freeDelivery),
        BagDataModel(isLabel: true, isCustomCell: false, cellType: .totalSaving),
        BagDataModel(isLabel: false, isCustomCell: true, cellType: .cartProduct),
        BagDataModel(isLabel: false, isCustomCell: true, cellType: .cartProduct),
        BagDataModel(isLabel: false, isCustomCell: true, cellType: .emi),
        BagDataModel(isLabel: false, isCustomCell: true, cellType: .orderSummary)
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "HomeBagCell", bundle: nil), forCellReuseIdentifier: "HomeBagCell")
        tableView.register(UINib(nibName: "FreeDeliveryCell", bundle: nil), forCellReuseIdentifier: "FreeDeliveryCell")
        tableView.register(UINib(nibName: "TotalSavingCell", bundle: nil), forCellReuseIdentifier: "TotalSavingCell")
        tableView.register(UINib(nibName: "CartProductCell", bundle: nil), forCellReuseIdentifier: "CartProductCell")
        tableView.register(UINib(nibName: "EMICell", bundle: nil), forCellReuseIdentifier: "EMICell")
        tableView.register(UINib(nibName: "OrderSummaryCell", bundle: nil), forCellReuseIdentifier: "OrderSummaryCell")
        
//        self.navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        fetchData()
//        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    //https://ov-dev.sssports.com/s/UAE/dw/shop/v20_10/customers/bcbpcY1HgG9oyITnupOjaFha8w/baskets?locale=en-AE

    //MARK: Functions
    func fetchData(){
        var components = URLComponents()
        components.scheme = "https"
        components.host = "ov-dev.sssports.com"
        components.path = "/s/UAE/dw/shop/v20_10/customers/bcbpcY1HgG9oyITnupOjaFha8w/baskets"
        components.queryItems = [
            URLQueryItem(name: "locale", value: "en-AE")
        ]
        guard let url = components.url else {return}
        guard let token = UserDefaults.standard.string(forKey: "authToken") else {return}
        let header = [
            "Authorization": token
        ]
        APIManager.shared.fetchData(pageUrl: url.absoluteString, httpHeaders: header, dataModel: AddToCartModel.self) { (data,response, error) in
            print(data)
        }
    }
    
    
    
}

extension BagHomePageController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if userLoggedin == true{
            return dataArr.count
        }
        else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if userLoggedin == true {
            let index = dataArr[indexPath.row]
            switch index.cellType {
            
            case .freeDelivery:
                let cell = tableView.dequeueReusableCell(withIdentifier: "FreeDeliveryCell", for: indexPath)
                return cell
                
            case .totalSaving:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TotalSavingCell", for: indexPath)
            return cell
                
            case .cartProduct:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CartProductCell", for: indexPath)
            return cell
                
            case .emi:
            let cell = tableView.dequeueReusableCell(withIdentifier: "EMICell", for: indexPath)
            return cell
                
            case .orderSummary:
            let cell = tableView.dequeueReusableCell(withIdentifier: "OrderSummaryCell", for: indexPath)
            return cell
                
            default:
                return UITableViewCell()
            }
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeBagCell", for: indexPath)
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if userLoggedin == true {
//            if indexPath.row == 2 {
//                return 200
//            }
            return UITableView.automaticDimension
        }
        else{
            return tableView.frame.height/3.2
            
        }

    }
    
}
