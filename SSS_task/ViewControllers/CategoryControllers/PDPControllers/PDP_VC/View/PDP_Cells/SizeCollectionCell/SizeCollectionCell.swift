//
//  SizeCollectionCell.swift
//  SSS_task
//
//  Created by Sunny Patel on 04/10/23.
//

import UIKit

class SizeCollectionCell: UICollectionViewCell {
    
    //MARK: IBoutlet
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var view: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        view.layer.cornerRadius = 8
        
        // Initialization code
    }
    
}
