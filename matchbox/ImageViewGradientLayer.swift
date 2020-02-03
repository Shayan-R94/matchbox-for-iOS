//
//  ImageViewGradientLayer.swift
//  matchbox
//
//  Created by Shayan Rastegar on 15/07/2017.
//  Copyright © 2017 Shayan Rastegar. All rights reserved.
//

import Foundation
import UIKit


class ImageViewWithGradient: UIImageView {
    
    let myGradientLayer: CAGradientLayer
    
    override init(frame: CGRect)
    {
        myGradientLayer = CAGradientLayer()
        super.init(frame: frame)
        self.setup()
    }
    
    required init(coder aDecoder: NSCoder)
    {
        myGradientLayer = CAGradientLayer()
        super.init(coder: aDecoder)!
        self.setup()
    }
    
    func setup()
    {
        myGradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        myGradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        let colors: [CGColor] =
    [
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.8).cgColor,
            UIColor.clear.cgColor,
            UIColor.clear.cgColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.8).cgColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 1.0).cgColor
    ]
        myGradientLayer.colors = colors
        myGradientLayer.isOpaque = false
        myGradientLayer.locations = [0.12, 0.2, 0.6, 0.75, 1.0]
        self.layer.addSublayer(myGradientLayer)
    }
    
    override func layoutSubviews()
    {
        myGradientLayer.frame = self.layer.bounds
    }
}
