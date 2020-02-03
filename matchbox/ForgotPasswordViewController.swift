//
//  ForgotPasswordViewController.swift
//  matchbox
//
//  Created by Shayan Rastegar on 27/06/2017.
//  Copyright © 2017 Shayan Rastegar. All rights reserved.
//

import Foundation
import UIKit

class ForgotPasswordViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var matchboxLogoShadow: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Setting the tap gesture to the matchboxLogoShadow.
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        matchboxLogoShadow.isUserInteractionEnabled = true
        matchboxLogoShadow.addGestureRecognizer(tapGestureRecognizer)
        
        // Text field
        self.emailTextField.delegate = self
        
        // Setting text field padding so text does not overlap icon.
        emailTextField.setLeftPaddingPoints(45)
        
        // Removing autocorrect in email text field.
        emailTextField.autocorrectionType = .no
        
        // Dismiss keyboard on tapping anywhere else.
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        
        _ = tapGestureRecognizer.view as! UIImageView
        
        // This is the bounce down animation.
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 5, options: UIView.AnimationOptions.allowUserInteraction, animations: { () -> Void in
            
            // This code sets the scale of the view to 70%.
            self.matchboxLogoShadow.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        }, completion: nil)
        
        // This is the bounce up animation, runs at the same time as bounce down.
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 5, options: UIView.AnimationOptions.allowUserInteraction, animations: { () -> Void in
            
            // This code sets the scale of the view to 100%.
            self.matchboxLogoShadow.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: nil)
    }
    
    // Dismiss keyboard on 'done'.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true;
    }
}
