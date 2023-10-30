//
//  ExpandableCell.swift
//  SSS_task
//
//  Created by Sunny Patel on 04/10/23.
//

import UIKit

class ExpandableCell: UITableViewCell {
    
    //MARK: IBOutlets
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var accesooryImage: UIImageView!
    @IBOutlet weak var expandableView: UIView!
    
    //MARK: Variables
    var isExpandableHidden = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    //MARK: Functions
    func setData(model: ExpandableCellDataModel){
        headerLabel.text = model.title
        expandableView.isHidden = !model.isExpanded
        accesooryImage.image = (model.isExpanded ? UIImage(systemName: "chevron.up") : UIImage(systemName: "chevron.down"))?.withRenderingMode(.alwaysTemplate)
    }
}
