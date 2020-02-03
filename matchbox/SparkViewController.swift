//
//  SparkViewController.swift
//  matchbox
//
//  Created by Shayan Rastegar on 26/07/2017.
//  Copyright © 2017 Shayan Rastegar. All rights reserved.
//

import UIKit

class SparkViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var profileAboutTextView: UITextView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Setting the background of 'about' text view to custom gradient image.
        profileAboutTextView.layer.contents = UIImage(named: "ProfileAboutTextField")!.cgImage
        
        profileAboutTextView.frame.size.width = UIScreen.main.bounds.width
        
        // Setting images for profile.
        let image1 = UIImage.init(named: "spark1")!
        let image2 = UIImage.init(named: "spark2")!
        let image3 = UIImage.init(named: "spark3")!
        
        let images: Array<UIImage> = [image1, image2, image3]
        
        // Setting number of pages to match number of images.
        pageControl.numberOfPages = images.count
        
        self.scrollView.isPagingEnabled = true
        self.scrollView.delegate = self
        
        var index = 0
        
        for image in images {
            
            // Setup new UIImageView
            let imageView = ImageViewWithGradient.init(frame: CGRect.init(origin: CGPoint(x: 0, y: 0), size: CGSize(width: UIScreen.main.bounds.width, height: self.scrollView.frame.size.height)))
            
            // Add image to imageview and set content mode
            imageView.image = image as UIImage
            imageView.contentMode = .scaleAspectFill
            
            imageView.autoresizingMask = UIView.AutoresizingMask.flexibleHeight
            
            imageView.clipsToBounds = true
            
            // Crates the new frame for the image
            var newFrame = imageView.frame
            newFrame.origin.x = self.view.frame.width * CGFloat(index)
            imageView.frame = newFrame
            
            // Add the imageview to the scrollview
            self.scrollView.addSubview(imageView)
            
            index += 1
            
        }
        
        // Set the content size and the content offset of the scroll view.
        self.scrollView.contentSize = CGSize(width: self.view.frame.size.width * CGFloat(images.count), height: 1.0)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let width = scrollView.frame.size.width
        let page = (scrollView.contentOffset.x + (CGFloat(0.5) * width)) / width
        self.pageControl.currentPage = Int(page)
        
    }
}
