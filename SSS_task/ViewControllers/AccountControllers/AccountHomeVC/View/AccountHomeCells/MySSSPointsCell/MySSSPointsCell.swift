//
//  MySSSPointsCell.swift
//  SSS_task
//
//  Created by Sunny Patel on 29/09/23.
//

import UIKit

class MySSSPointsCell: UITableViewCell {
    //MARK: IBOutlet
    @IBOutlet weak var managerView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        managerView.layer.cornerRadius = 12
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
