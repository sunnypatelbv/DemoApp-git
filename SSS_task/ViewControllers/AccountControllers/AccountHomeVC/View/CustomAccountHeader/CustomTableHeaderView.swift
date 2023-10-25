//
//  CustomTableHeaderView.swift
//  SSS_task
//
//  Created by Sunny Patel on 20/09/23.
//

import UIKit

class CustomTableHeaderView: UITableViewHeaderFooterView, UITextViewDelegate {
    
    //MARK: IBOutlets
    @IBOutlet weak var signinTxtView: UITextView!
    @IBOutlet weak var nameLabel: UILabel!
    //MARK: Variables
    var completionHandler: ((String)->())?
    
    
    
    override func awakeFromNib() {
        let text = NSMutableAttributedString(string: "")
        text.addAttribute(NSAttributedString.Key.font,
                          value: UIFont.systemFont(ofSize: 16),
                          range: NSRange(location: 0, length: text.length))
        
        let interactableText = NSMutableAttributedString(string: "Sign up")
        interactableText.addAttribute(NSAttributedString.Key.font,
                                      value: UIFont.systemFont(ofSize: 16),
                                      range: NSRange(location: 0, length: interactableText.length))
        interactableText.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: _NSRange(location: 0, length: interactableText.length))
        
        // Adding the link interaction to the interactable text
        interactableText.addAttribute(NSAttributedString.Key.link,
                                      value: "SignInPseudoLink",
                                      range: NSRange(location: 0, length: interactableText.length))
        
        let text2 = NSMutableAttributedString(string: "  or  ")
        text2.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 16), range: NSRange(location: 0, length: text2.length))

        let interactableText2 = NSMutableAttributedString(string: "Login ")
        interactableText2.addAttribute(NSAttributedString.Key.font,
                                      value: UIFont.systemFont(ofSize: 16),
                                      range: NSRange(location: 0, length: interactableText2.length))
        interactableText2.addAttribute(NSAttributedString.Key.font,
                                      value: UIFont.systemFont(ofSize: 16),
                                      range: NSRange(location: 0, length: interactableText2.length))
        interactableText2.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: _NSRange(location: 0, length: interactableText2.length))
        
        // Adding the link interaction to the interactable text
        interactableText2.addAttribute(NSAttributedString.Key.link,
                                      value: "LogInPseudoLink",
                                      range: NSRange(location: 0, length: interactableText2.length))
        
        // Adding it all together
        text.append(interactableText)
        text.append(text2)
        text.append(interactableText2)
        
        
        
        // Set the text view to contain the attributed text
        signinTxtView.attributedText = text
        
        // Disable editing, but enable selectable so that the link can be selected
        signinTxtView.isEditable = false
        signinTxtView.isSelectable = true
        signinTxtView.delegate = self
        
      
        
    
    }
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        if (URL.absoluteString) == "SignInPseudoLink"{
            completionHandler?("signin")
            
        }
        else if (URL.absoluteString) == "LogInPseudoLink"{
            completionHandler?("login")
        }
        return true
    }
    
}
