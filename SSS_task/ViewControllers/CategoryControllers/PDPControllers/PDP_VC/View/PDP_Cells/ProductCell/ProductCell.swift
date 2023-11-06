//
//  ProductCell.swift
//  SSS_task
//
//  Created by Sunny Patel on 06/10/23.
//

import UIKit

class ProductCell: UITableViewCell {
    
    //MARK: IBOutlet
    @IBOutlet weak var addBagBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addBagBtn.layer.cornerRadius = 12
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
