//
//  AppOptionsViewCell.swift
//  SSS_task
//
//  Created by Sunny Patel on 25/09/23.
//

import UIKit

class AppOptionsViewCell: UITableViewCell {
    
    //MARK: IBOutlet
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: Variables
    var changeVC: ((String) -> ())?
    var getHelpIconsArr = [
        IconsModel(iconTitle: "Live Chat", iconImgName: "livechat", identifier: .livechat),
        IconsModel(iconTitle: "Contact us", iconImgName: "contactus", identifier: .contact),
        IconsModel(iconTitle: "FAQs", iconImgName: "faqs", identifier: .faq),
        IconsModel(iconTitle: "Policies", iconImgName: "policies", identifier: .policy)
    ]
    
    var myAccountIconsArr = [
        IconsModel(iconTitle: "Addresses", iconImgName: "livechat", identifier: .address),
        IconsModel(iconTitle: "Profile", iconImgName: "contactus", identifier: .profile),
        IconsModel(iconTitle: "Settings", iconImgName: "faqs", identifier: .setting)
    ]
    
    var dataArr : [IconsModel] = []
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
    
    func setupCell(_ identifier: AccountOption){
        switch identifier{
        case .helpOptions:
            dataArr = getHelpIconsArr
        case .accountOptions:
            dataArr = myAccountIconsArr
        default:
            return
        }
    }
    
}


//MARK: UICollectionView Delegates and DataSource
extension AppOptionsViewCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        return dataArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let model = dataArr[indexPath.row]
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AccountOptionsCollectionCell", for: indexPath) as? AccountOptionsCollectionCell else { return UICollectionViewCell() }
        switch model.identifier{
        case .setting:
            cell.imageView.image = UIImage(named: "settings")
            cell.lblImage.text = model.iconTitle
        case .livechat:
            cell.imageView.image = UIImage(named: "livechat")
            cell.lblImage.text = model.iconTitle
        case .contact:
            cell.imageView.image = UIImage(named: "contactus")
            cell.lblImage.text = model.iconTitle
        case .faq:
            cell.imageView.image = UIImage(named: "faqs")
            cell.lblImage.text = model.iconTitle
        case .policy:
            cell.imageView.image = UIImage(named: "policies")
            cell.lblImage.text = model.iconTitle
        case .address:
            cell.imageView.image = UIImage(named: "orders")
            cell.lblImage.text = model.iconTitle
        case .profile:
            cell.imageView.image = UIImage(named: "orders")
            cell.lblImage.text = model.iconTitle
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
        let model = dataArr[indexPath.row]
        
        if model.iconTitle == "Profile"{
            print("Profile selected")
            changeVC?("Profile")
        }
    }
}
