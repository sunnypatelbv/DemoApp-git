//
//  FunZoneTableCell.swift
//  SSS_task
//
//  Created by Sunny Patel on 21/09/23.
//

import UIKit

class FunZoneTableCell: UITableViewCell {
    
    //MARK: IBOutlet
    @IBOutlet weak var manageView: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        manageView.layer.borderWidth = 2
        manageView.layer.cornerRadius = 10
        manageView.layer.borderColor = UIColor.black.cgColor
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
