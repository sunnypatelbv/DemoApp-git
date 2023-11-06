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
    var plpViewModel = PLPViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "ProductDetailCollectionCell", bundle: nil), forCellWithReuseIdentifier: "ProductDetailCollectionCell")
        self.navigationController?.navigationBar.isHidden = true
        plpViewModel.getData()
        plpViewModel.delegate = self
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
    
}

extension CategoryHomeViewController: PLPViewModelDelegate{
    func onFailure(error: Error?) {
        print(error?.localizedDescription)
    }
    
    
    func onSuccess() {
        self.collectionView.reloadData()
    }
    
    
}
