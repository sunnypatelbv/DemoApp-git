//
//  SettingsOptionCell.swift
//  SSS_task
//
//  Created by Sunny Patel on 25/09/23.
//

import UIKit

class SettingsOptionCell: UITableViewCell {
    
    //MARK: IBOutlet
    @IBOutlet weak var settingsLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
