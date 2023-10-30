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
    var iconsArr = [
        IconsModel(iconTitle: "Live Chat", iconImgName: "livechat"),
        IconsModel(iconTitle: "Contact us", iconImgName: "contactus"),
        IconsModel(iconTitle: "FAQs", iconImgName: "faqs"),
        IconsModel(iconTitle: "Policies", iconImgName: "policies")
    ]
    
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
extension AppOptionsViewCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return iconsArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let model = iconsArr[indexPath.row]
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AccountOptionsCollectionCell", for: indexPath) as? AccountOptionsCollectionCell else { return UICollectionViewCell() }
        
        if model.iconTitle == "Live Chat"{
            cell.imageView.image = UIImage(named: "orders")
            cell.lblImage.text = "Live Chat"
        } else if model.iconTitle == "Contact us" {
            cell.imageView.image = UIImage(named: "stores")
            cell.lblImage.text = "Contact us"
        } else if model.iconTitle == "FAQs"{
            cell.imageView.image = UIImage(named: "faqs")
            cell.lblImage.text = "FAQs"
        }
        else if model.iconTitle == "Policies"{
            cell.imageView.image = UIImage(named: "policies")
            cell.lblImage.text = "Policies"
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right:10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 74)
    }
    
}
