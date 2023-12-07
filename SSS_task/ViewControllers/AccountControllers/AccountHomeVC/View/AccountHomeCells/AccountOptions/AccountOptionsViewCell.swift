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
        IconsModel(iconTitle: "Orders", iconImgName: "orders", identifier: .order),
        IconsModel(iconTitle: "Stores", iconImgName: "stores", identifier: .store),
        IconsModel(iconTitle: "Settings", iconImgName: "settings", identifier: .setting)
    ]
    
    var iconsArrLoggedin = [
        IconsModel(iconTitle: "Orders", iconImgName: "orders", identifier: .order
                  ),
        IconsModel(iconTitle: "Returns", iconImgName: "stores", identifier: .returns),
        IconsModel(iconTitle: "Payment", iconImgName: "settings", identifier: .payment),
        IconsModel(iconTitle: "Stores", iconImgName: "stores", identifier: .store)
    ]
    
    var userDefault: Bool {
        UserDefaults.standard.bool(forKey: "isUserLoggedInUserDefault")
    }
    
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
        if userDefault {
            return iconsArrLoggedin.count
        }
        else {
            return iconsArr.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var model: IconsModel?
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AccountOptionsCollectionCell", for: indexPath) as? AccountOptionsCollectionCell else { return UICollectionViewCell() }
        if userDefault {
            model = iconsArrLoggedin[indexPath.row]
        }
        else {
            model = iconsArr[indexPath.row]
        }
        
        switch model?.identifier{
        case .order:
            cell.imageView.image = UIImage(named: "orders")
            cell.lblImage.text = model?.iconTitle
        case .store:
            cell.imageView.image = UIImage(named: "stores")
            cell.lblImage.text = model?.iconTitle
        case .setting:
            cell.imageView.image = UIImage(named: "settings")
            cell.lblImage.text = model?.iconTitle
        case .payment:
            cell.imageView.image = UIImage(named: "orders")
            cell.lblImage.text = model?.iconTitle
        case .returns:
            cell.imageView.image = UIImage(named: "stores")
            cell.lblImage.text = model?.iconTitle
        default:
            return UICollectionViewCell()
        }
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right:20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 70, height: 74)
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
