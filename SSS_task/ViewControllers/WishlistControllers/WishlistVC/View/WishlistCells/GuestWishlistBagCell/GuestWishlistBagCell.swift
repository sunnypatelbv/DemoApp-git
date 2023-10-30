//
//  GuestWishlistBagCell.swift
//  SSS_task
//
//  Created by Sunny Patel on 11/10/23.
//

import UIKit

class GuestWishlistBagCell: UICollectionViewCell {
    
    //MARK: IBOutlets
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var actionBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        actionBtn.layer.cornerRadius = 12
    }
    
}
