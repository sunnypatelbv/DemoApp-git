//
//  NewCustomerCell.swift
//  SSS_task
//
//  Created by Sunny Patel on 22/09/23.
//

import UIKit

class NewCustomerCell: UITableViewCell {
    
    //MARK: IBOutlet
    @IBOutlet weak var label: UILabel!
    
    //MARK: Variables
    var goToSignin: ((String) -> ())?
    
    override func awakeFromNib() {
        label.isUserInteractionEnabled = true
        super.awakeFromNib()
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        tap.numberOfTapsRequired = 1
        label.addGestureRecognizer(tap)
        
        // Initialization code
        let text = NSMutableAttributedString(string: "New Customer? ")
        text.addAttribute(NSAttributedString.Key.font,
                          value: UIFont.systemFont(ofSize: 16),
                          range: NSRange(location: 0, length: text.length))
        
        let interactableText = NSMutableAttributedString(string: "Join Now ")
        interactableText.addAttribute(NSAttributedString.Key.font,
                                      value: UIFont.systemFont(ofSize: 16),
                                      range: NSRange(location: 0, length: interactableText.length))
        
        // Adding the link interaction to the interactable text
        interactableText.addAttribute(NSAttributedString.Key.link,
                                      value: "SignInPseudoLink",
                                      range: NSRange(location: 0, length: interactableText.length))
        text.append(interactableText)
        label.attributedText = text
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @objc func handleTap(_ gesture: UITapGestureRecognizer) {
        // handling code
        guard let text = self.label.text else {return}
        let range = (text as NSString).range(of: "Join Now ")
        
        if gesture.didTapAttributedTextInLabel(label: self.label, inRange: range){
            
            goToSignin?("signin")
        }
    }
    
    
}


