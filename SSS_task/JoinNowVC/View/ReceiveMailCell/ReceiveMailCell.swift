//
//  ReceiveMailCell.swift
//  SSS_task
//
//  Created by Sunny Patel on 22/09/23.
//

import UIKit
import SimpleCheckbox

class ReceiveMailCell: UITableViewCell {
    //MARK: IBOutlet
    @IBOutlet weak var checkBoxView: Checkbox!
    @IBOutlet weak var lblTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        checkBoxView.checkmarkStyle = .tick
        checkBoxView.checkedBorderColor = .black
        checkBoxView.uncheckedBorderColor = .black
        checkBoxView.checkmarkColor = .black
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
