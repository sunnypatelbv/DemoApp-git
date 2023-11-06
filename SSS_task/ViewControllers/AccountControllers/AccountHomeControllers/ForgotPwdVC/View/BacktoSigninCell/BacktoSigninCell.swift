//
//  BacktoSigninCell.swift
//  SSS_task
//
//  Created by Sunny Patel on 26/09/23.
//

import UIKit

class BacktoSigninCell: UITableViewCell {
    
    //MARK: IBOutlets
    @IBOutlet weak var button: UIButton!
    
    //MARK: Variables
    var goToSigin: ((String) -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    //MARK: IBActions
    @IBAction func backtosignin(_ sender: UIButton){
        goToSigin?("signin")
    }
    
}
