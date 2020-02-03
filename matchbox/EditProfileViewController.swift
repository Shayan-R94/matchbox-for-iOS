//
//  EditProfileViewController.swift
//  matchbox
//
//  Created by Shayan Rastegar on 14/08/2018.
//  Copyright © 2018 Shayan Rastegar. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Setting the background of 'about' text view to custom gradient image.
        profileAboutTextView.layer.contents = UIImage(named: "ProfileAboutTextField")!.cgImage
        profileAboutTextView.frame.size.width = UIScreen.main.bounds.width
        
        // Setting the tap gesture to the matchboxLogoShadow.
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        matchboxLogo.isUserInteractionEnabled = true
        matchboxLogo.addGestureRecognizer(tapGestureRecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBOutlet weak var profileAboutTextView: UITextView!
    @IBOutlet weak var matchboxLogo: UIImageView!
    
    @IBAction func doneEditingProfileButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        
        _ = tapGestureRecognizer.view as! UIImageView
        
        // This is the bounce down animation.
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 5, options: UIView.AnimationOptions.allowUserInteraction, animations: { () -> Void in
            
            // This code sets the scale of the view to 70%.
            self.matchboxLogo.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        }, completion: nil)
        
        // This is the bounce up animation, runs at the same time as bounce down.
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 5, options: UIView.AnimationOptions.allowUserInteraction, animations: { () -> Void in
            
            // This code sets the scale of the view to 100%.
            self.matchboxLogo.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: nil)
    }
    
}
