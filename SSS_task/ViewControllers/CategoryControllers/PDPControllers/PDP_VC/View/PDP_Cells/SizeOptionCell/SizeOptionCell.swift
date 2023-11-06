//
//  SizeOptionCell.swift
//  SSS_task
//
//  Created by Sunny Patel on 04/10/23.
//

import UIKit

class SizeOptionCell: UITableViewCell {
    
    //MARK: IBOutlet
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    //MARK: Variables
    var smallArr = ["4","5","6","7","More"]
    var bigArr = ["4","5","6","7","8","9","10","11","12","13","Less"]
    
    override func awakeFromNib() {
        collectionView.register(UINib(nibName: "SizeCollectionCell", bundle: nil), forCellWithReuseIdentifier: "SizeCollectionCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        let height = self.collectionView.collectionViewLayout.collectionViewContentSize.height
        self.heightConstraint.constant = height
        self.contentView.layoutIfNeeded()
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

//MARK: UICollectionView Delegates and DataSource
extension SizeOptionCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return smallArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SizeCollectionCell", for: indexPath) as? SizeCollectionCell else {return UICollectionViewCell()}
        cell.label.text = smallArr [indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width )/5 , height: 35)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.0,left: 5.0,bottom: 0.0,right: 5.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SizeCollectionCell", for: indexPath) as? SizeCollectionCell else {return}
        let cell = collectionView.cellForItem(at: indexPath) as? SizeCollectionCell
        if cell?.label.text == "More"{
            print("show more")
        }
    }
    
}
