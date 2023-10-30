//
//  ForgotPasswordCell.swift
//  SSS_task
//
//  Created by Sunny Patel on 22/09/23.
//

import UIKit

class ForgotPasswordCell: UITableViewCell {
    
    //MARK: IBOutlet
    @IBOutlet weak var forgotBtn: UIButton!
    
    //MARK: Variables
    var goToForgot: ((String) -> ())?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    //MARK: IBActions
    @IBAction func forgotPassword(_ sender: UIButton){
        print("forgot pass")
        goToForgot?("forgot")
    }
}
