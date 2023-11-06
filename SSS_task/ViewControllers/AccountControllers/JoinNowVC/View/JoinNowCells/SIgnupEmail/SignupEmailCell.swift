//
//  SignupEmailCell.swift
//  SSS_task
//
//  Created by Sunny Patel on 21/09/23.
//

import UIKit

class SignupEmailCell: UITableViewCell {
    
    //MARK: IBOutlet
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
