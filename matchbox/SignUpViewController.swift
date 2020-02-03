//
//  SignUpViewController.swift
//  matchbox
//
//  Created by Shayan Rastegar on 21/06/2017.
//  Copyright © 2017 Shayan Rastegar. All rights reserved.
//

import Foundation
import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var matchboxLogoShadow: UIImageView!
    @IBOutlet weak var firstNameSignUpTextField: UITextField!
    @IBOutlet weak var lastNameSignUpTextField: UITextField!
    @IBOutlet weak var dateOBSignUpTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var intrestedInTextField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    let genderOptions = ["male", "female"]
    let intrestOptions = ["male", "female"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Setting the tap gesture to the matchboxLogoShadow.
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        matchboxLogoShadow.isUserInteractionEnabled = true
        matchboxLogoShadow.addGestureRecognizer(tapGestureRecognizer)
        
        // Text fields
        self.firstNameSignUpTextField.delegate = self
        self.lastNameSignUpTextField.delegate = self
        self.dateOBSignUpTextField.delegate = self
        self.genderTextField.delegate = self
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        self.confirmPasswordTextField.delegate = self
        self.intrestedInTextField.delegate = self
        
        // Setting text field padding so text does not overlap icon.
        firstNameSignUpTextField.setLeftPaddingPoints(45)
        lastNameSignUpTextField.setLeftPaddingPoints(45)
        dateOBSignUpTextField.setLeftPaddingPoints(45)
        genderTextField.setLeftPaddingPoints(45)
        emailTextField.setLeftPaddingPoints(45)
        passwordTextField.setLeftPaddingPoints(45)
        confirmPasswordTextField.setLeftPaddingPoints(45)
        intrestedInTextField.setLeftPaddingPoints(45)
        
        // Removing autocorrect in email text field.
        emailTextField.autocorrectionType = .no
        
        // Setting date picker to date of birth text field.
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = UIDatePicker.Mode.date
        datePicker.addTarget(self, action: #selector(SignUpViewController.datePickerValueChanged(sender:)), for: UIControl.Event.valueChanged)
        dateOBSignUpTextField.inputView = datePicker
        
        // Setting minimum age to 17 years old.
        datePicker.maximumDate = Calendar.current.date(byAdding: .year, value: -17, to: Date())
        
        // Setting picker to gender & intrest textfields.
        let genderPickerView = UIPickerView()
        genderPickerView.delegate = self
        genderPickerView.tag = 1
        genderTextField.inputView = genderPickerView
        
        let intrestPickerView = UIPickerView()
        intrestPickerView.delegate = self
        intrestPickerView.tag = 2
        intrestedInTextField.inputView = intrestPickerView
        
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
    
    // Date picker.
    @objc func datePickerValueChanged(sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.medium
        formatter.timeStyle = DateFormatter.Style.none
        dateOBSignUpTextField.text = formatter.string(from: sender.date)
    }
    
    // Dismiss picker on touch anywhere outside of picker.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // Picker view for gender & intrest.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return genderOptions.count
        } else if pickerView.tag == 2 {
            return intrestOptions.count
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return genderOptions[row]
        } else if pickerView.tag == 2 {
            return intrestOptions[row]
        }
        return nil
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            genderTextField.text = genderOptions[row]
        } else if pickerView.tag == 2 {
            intrestedInTextField.text = intrestOptions[row]
        }
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        let firstNameSignUp = firstNameSignUpTextField.text
        let lastNameSignUp = lastNameSignUpTextField.text
        let dateOBSignUp = dateOBSignUpTextField.text
        let genderSignUp = genderTextField.text
        let emailSignUp = emailTextField.text
        let passwordSignUp = passwordTextField.text
        let confirmPasswordSignUp = confirmPasswordTextField.text
        let intrestedInSignUp = intrestedInTextField.text
        
        // Check for empty fields.
        if((firstNameSignUp?.isEmpty)! || (lastNameSignUp?.isEmpty)! || (dateOBSignUp?.isEmpty)! || (genderSignUp?.isEmpty)! || (emailSignUp?.isEmpty)! || (passwordSignUp?.isEmpty)! || (confirmPasswordSignUp?.isEmpty)! || (intrestedInSignUp?.isEmpty)!)
        {
            // Display alert message.
            displayAlertMessage(message: "All fields are required.")
            return
        }
        
        // Check if passwords match.
        if(passwordSignUp != confirmPasswordSignUp)
        {
            // Display alert message.
            displayAlertMessage(message: "Passwords do not match.")
            return
        }
        
        if ((passwordSignUp?.count)! < 6) || ((passwordSignUp?.count)! > 20) &&
            ((confirmPasswordSignUp?.count)! < 6) || ((confirmPasswordSignUp?.count)! > 20)
        {
            displayAlertMessage(message: "Password must be at least 6 characters, but not more than 20 characters in length.")
            return
        }
        
        if emailSignUp?.isValidEmail() == false {
            displayAlertMessage(message: "Enter a valid email.")
            return
        }
        
        // Store data.
        
    }
    
    func displayAlertMessage(message: String) {
        let alert = UIAlertController(title: "Oops!", message: message, preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "Ok", style:UIAlertAction.Style.default, handler: nil)
        
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension String {
    func isValidEmail() -> Bool {
        // Here, 'try!' will always succeed because the pattern is valid.
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
}









