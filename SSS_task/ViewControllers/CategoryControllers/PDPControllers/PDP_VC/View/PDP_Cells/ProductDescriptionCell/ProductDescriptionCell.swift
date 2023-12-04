//
//  ProductDescriptionCell.swift
//  SSS_task
//
//  Created by Sunny Patel on 03/10/23.
//

import UIKit

class ProductDescriptionCell: UITableViewCell {
    
    //MARK: IBOutlet
    @IBOutlet weak var brandName: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var originalPrice: UILabel!
    @IBOutlet weak var salePrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: "AED 620.00")
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSRange(location: 0, length: attributeString.length))
        originalPrice.attributedText = attributeString
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    //MARK: Functions
    func showData(model: PDPModel){
        print(model.name)
        if let brand = model.brand {
            brandName.text = brand
        }
        if let name  = model.name{
            productName.text = name
        }
        if let ogprice = model.cListPrice{
            originalPrice.text = "AED. \(ogprice).00"
        }
        if let saleprice = model.cSalePrice{
            salePrice.text = "AED. \(saleprice).00"
        }
    }
}
