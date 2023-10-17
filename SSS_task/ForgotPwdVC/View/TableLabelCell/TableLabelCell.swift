//
//  TableLabelCell.swift
//  SSS_task
//
//  Created by Sunny Patel on 26/09/23.
//

import UIKit

class TableLabelCell: UITableViewCell {
    
    //MARK: IBOutlet
    @IBOutlet weak var label: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
