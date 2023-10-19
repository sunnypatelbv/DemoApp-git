//
//  RegistrationBtnCell.swift
//  SSS_task
//
//  Created by Sunny Patel on 21/09/23.
//

import UIKit

class RegistrationBtnCell: UITableViewCell {
    
    //MARK: IBOutlets
    @IBOutlet weak var viewForItem: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblTitle : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
        viewForItem.layer.borderWidth = 2
        viewForItem.layer.borderColor = UIColor.gray.cgColor
        viewForItem.layer.cornerRadius = 12
        viewForItem.backgroundColor = .darkGray
        lblTitle.textColor = .white
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
