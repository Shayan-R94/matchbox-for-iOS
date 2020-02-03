//
//  LoginViewController.swift
//  matchbox
//
//  Created by Shayan Rastegar on 02/06/2017.
//  Copyright © 2017 Shayan Rastegar. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var matchboxLogoShadow: UIImageView!
    @IBOutlet weak var emailLoginTextField: UITextField!
    @IBOutlet weak var passwordLoginTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Setting the navigation bar to invisible and just showing back button.
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
                
        // Setting the tap gesture to the matchboxLogoShadow.
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        matchboxLogoShadow.isUserInteractionEnabled = true
        matchboxLogoShadow.addGestureRecognizer(tapGestureRecognizer)
        
        // Text fields
        self.emailLoginTextField.delegate = self
        self.passwordLoginTextField.delegate = self
        
        // Setting text field padding so text does not overlap icon.
        emailLoginTextField.setLeftPaddingPoints(45)
        passwordLoginTextField.setLeftPaddingPoints(45)
        
        // Removing autocorrect in email text field.
        emailLoginTextField.autocorrectionType = .no
        
        // Dismiss keyboard on tapping anywhere else.
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    @IBAction func loginButton(_ sender: Any) {
        
        // Setting profile viewController as rootViewController, eliminating back button on nav bar.
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "navigationController2") as! NavigationController2
        UIApplication.shared.keyWindow?.rootViewController = viewController
                
    }

}
