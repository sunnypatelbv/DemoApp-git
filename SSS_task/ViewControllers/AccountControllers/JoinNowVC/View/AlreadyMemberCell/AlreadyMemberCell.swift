//
//  AlreadyMemberCell.swift
//  SSS_task
//
//  Created by Sunny Patel on 22/09/23.
//

import UIKit

class AlreadyMemberCell: UITableViewCell {
    
    //MARK: IBOutlet
    @IBOutlet weak var lblTitle: UILabel!
    
    //MARK: Variables
    var goToLogin : ((String) -> ())?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        tap.numberOfTapsRequired = 1
        lblTitle.addGestureRecognizer(tap)
        // Initialization code
        let text = NSMutableAttributedString(string: "Already a Member ? ")
        text.addAttribute(NSAttributedString.Key.font,
                          value: UIFont.systemFont(ofSize: 16),
                          range: NSRange(location: 0, length: text.length))
        
        let interactableText = NSMutableAttributedString(string: "Sign in ")
        interactableText.addAttribute(NSAttributedString.Key.font,
                                      value: UIFont.systemFont(ofSize: 16),
                                      range: NSRange(location: 0, length: interactableText.length))
        
        // Adding the link interaction to the interactable text
        interactableText.addAttribute(NSAttributedString.Key.link,
                                      value: "SignInPseudoLink",
                                      range: NSRange(location: 0, length: interactableText.length))
        text.append(interactableText)
        lblTitle.attributedText = text
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @objc func handleTap(_ gesture: UITapGestureRecognizer) {
        // handling code
        guard let text = self.lblTitle.text else {return}
        let range = (text as NSString).range(of: "Sign in ")
        
        if gesture.didTapAttributedTextInLabel(label: self.lblTitle, inRange: range){
            print("tapped")
            goToLogin?("login")
        }
    }
    
    
    @IBAction func tapLabel(gesture: UITapGestureRecognizer) {
    }
    
}


extension UITapGestureRecognizer {
    
    func didTapAttributedTextInLabel(label: UILabel, inRange targetRange: NSRange) -> Bool {
        // Create instances of NSLayoutManager, NSTextContainer and NSTextStorage
        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: CGSize.zero)
        let textStorage = NSTextStorage(attributedString: label.attributedText!)
        
        // Configure layoutManager and textStorage
        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)
        
        // Configure textContainer
        textContainer.lineFragmentPadding = 0.0
        textContainer.lineBreakMode = label.lineBreakMode
        textContainer.maximumNumberOfLines = label.numberOfLines
        let labelSize = label.bounds.size
        textContainer.size = labelSize
        
        // Find the tapped character location and compare it to the specified range
        let locationOfTouchInLabel = self.location(in: label)
        let textBoundingBox = layoutManager.usedRect(for: textContainer)
        let textContainerOffset = CGPoint(
            x: (labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x,
            y: (labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y
        )
        let locationOfTouchInTextContainer = CGPoint(
            x: locationOfTouchInLabel.x - textContainerOffset.x,
            y: locationOfTouchInLabel.y - textContainerOffset.y
        )
        let indexOfCharacter = layoutManager.characterIndex(for: locationOfTouchInTextContainer, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        
        return NSLocationInRange(indexOfCharacter, targetRange)
    }
    
}
