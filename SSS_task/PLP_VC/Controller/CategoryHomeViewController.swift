//
//  CategoryHomeViewController.swift
//  SSS_task
//
//  Created by Sunny Patel on 26/09/23.
//

import UIKit

class CategoryHomeViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: Variables
    var productArr = [Hit]()
    var counter = 24
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "ProductDetailCollectionCell", bundle: nil), forCellWithReuseIdentifier: "ProductDetailCollectionCell")
        self.navigationController?.navigationBar.isHidden = true
        fetchData(completionHandler: { [weak self] (data) in
            self!.productArr = data
            DispatchQueue.main.async {
                self!.collectionView.reloadData()
            }
            
        }, counter: counter)
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    //MARK: Functions
    
    func fetchData(completionHandler: @escaping ([Hit])->(), counter: Int){
        let url = URL(string: "https://ov-dev.sssports.com/s/UAE/dw/shop/v20_10/product_search?client_id=ce6abb4e-faf1-41af-94e7-feb1e2dd4a77&count=24&expand=prices,%20images,%20represented_products&locale=en-AE&refine=cgid%3Dbrands_nike&refine_1=htype%3Dvariation_group%7Cproduct&refine_2=price%3D(1..)&refine_3=orderable_only%3Dtrue&start=0")
        let task = URLSession.shared.dataTask(with: url!, completionHandler: { (data, response,error) in
            guard let data = data, error == nil else {return}
            do {
                let receivedData = try JSONDecoder().decode(ProductInformationModel.self, from: data)
                completionHandler(receivedData.hits!)
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
            catch {
                print("data not encoded")
            }
        })
        task.resume()
    }
    
}

//MARK: CollectionView Delegates and DataSource
extension CategoryHomeViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductDetailCollectionCell", for: indexPath) as? ProductDetailCollectionCell else {
            return UICollectionViewCell()
        }
        cell.showData(hit: productArr[indexPath.row], onIndexPath: indexPath.section)
        cell.closure = { [weak self] value in
            if value == true {
                guard let id = self!.productArr[indexPath.row].productID else {return}
                cell.prouctId = id
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("product description api calling")
        guard let vc = self.storyboard?.instantiateViewController(identifier: "PDPViewController") as? PDPViewController else {return}
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width - 30)/2, height: collectionView.frame.height/2.8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.0,left: 10.0,bottom: 0.0,right: 10.0)
    }
    
}
