//
//  AccountOptionsViewCell.swift
//  SSS_task
//
//  Created by Sunny Patel on 21/09/23.
//

import UIKit

class AccountOptionsViewCell: UITableViewCell {
    
    //MARK: IBOutlet
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: Variables
    var iconsArr = [
        IconsModel(iconTitle: "Orders", iconImgName: "orders"),
        IconsModel(iconTitle: "Stores", iconImgName: "stores"),
        IconsModel(iconTitle: "Settings", iconImgName: "settings")
    ]
    
    //    var iconsArrLogin = [
    //        IconsModel(iconTitle: "Orders", iconImgName: "orders"),
    //        IconsModel(iconTitle: "Returns", iconImgName: "stores"),
    //        IconsModel(iconTitle: "Payment Methods", iconImgName: "settings"),
    //        IconsModel(iconTitle: "Stores", iconImgName: "stores")
    //    ]
    var changeVC: ((String) -> ())?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(UINib(nibName: "AccountOptionsCollectionCell", bundle: nil), forCellWithReuseIdentifier: "AccountOptionsCollectionCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

//MARK: UICollectionView Delegates and DataSource
extension AccountOptionsViewCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return iconsArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let model = iconsArr[indexPath.row]
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AccountOptionsCollectionCell", for: indexPath) as? AccountOptionsCollectionCell else { return UICollectionViewCell() }
        
        if model.iconTitle == "Orders"{
            cell.imageView.image = UIImage(named: "orders")
            cell.lblImage.text = "Orders"
        } else if model.iconTitle == "Stores" {
            cell.imageView.image = UIImage(named: "stores")
            cell.lblImage.text = "Stores"
        } else if model.iconTitle == "Settings"{
            cell.imageView.image = UIImage(named: "settings")
            cell.lblImage.text = "Settings"
        }
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right:10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 74)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = iconsArr[indexPath.row]
        
        if model.iconTitle == "Orders"{
            print("Order selected")
            changeVC?("Orders")
        }
        else if model.iconTitle == "Stores"{
            print("Stores selectes")
            changeVC?("Stores")
        }
        else if model.iconTitle == "Settings"{
            print("Settings selected")
            changeVC?("Settings")
        }
    }
    
}
