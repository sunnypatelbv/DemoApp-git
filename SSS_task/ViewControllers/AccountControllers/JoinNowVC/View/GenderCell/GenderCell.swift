//
//  GenderCell.swift
//  SSS_task
//
//  Created by Sunny Patel on 22/09/23.
//

import UIKit

class GenderCell: UITableViewCell {
    
    //MARK: IBOutlet
    @IBOutlet weak var maleBtn: UIButton!
    @IBOutlet weak var femaleBtn: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        maleBtn.backgroundColor = .black
        maleBtn.titleLabel?.textColor = .white
        femaleBtn.backgroundColor = .lightGray
        femaleBtn.titleLabel?.textColor = .darkGray
        
        maleBtn.layer.cornerRadius = 12
        femaleBtn.layer.cornerRadius = 12
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func genderSelected(_ sender: UIButton){
        if sender.tag == 1 {
            maleBtn.backgroundColor = .black
            maleBtn.titleLabel?.textColor = .white
            femaleBtn.backgroundColor = .lightGray
            femaleBtn.titleLabel?.textColor = .darkGray
        }
        else if sender.tag == 2 {
            femaleBtn.backgroundColor = .black
            femaleBtn.titleLabel?.textColor = .white
            maleBtn.backgroundColor = .lightGray
            maleBtn.titleLabel?.textColor = .darkGray
        }
    }
}
