//
//  SubmitButtonCell.swift
//  SSS_task
//
//  Created by Sunny Patel on 26/09/23.
//

import UIKit

class SubmitButtonCell: UITableViewCell {
    
    //MARK: IBOutlets
    @IBOutlet weak var submitBtn: UIButton!
    
    //MARK: Variables
    var closure: ((Bool) -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        submitBtn.backgroundColor = .darkGray
        submitBtn.tintColor = .white
        submitBtn.setTitle("Reset Password", for: .normal)
        submitBtn.layer.cornerRadius = 8
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    //MARK: IBActions
    @IBAction func btnTapped(_ sender: UIButton){
        
        if sender.currentTitle == "Signin"{
            closure?(true)
        }
        
    }
    
}
