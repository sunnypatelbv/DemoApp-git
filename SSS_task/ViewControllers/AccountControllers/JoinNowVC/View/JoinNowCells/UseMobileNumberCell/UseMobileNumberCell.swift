//
//  UseMobileNumberCell.swift
//  SSS_task
//
//  Created by Sunny Patel on 26/09/23.
//

import UIKit

class UseMobileNumberCell: UITableViewCell {
    
    //MARK: IBOutlet
    @IBOutlet weak var label: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]
        let underlineAttributedString = NSAttributedString(string: "Use your mobile number instead", attributes: underlineAttribute)
        label.attributedText = underlineAttributedString
        
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
