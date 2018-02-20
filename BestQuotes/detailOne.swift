//
//  detailOne.swift
//  BestQuotes
//
//  Created by user on 9/20/17.
//  Copyright © 2017 Hailemichael. All rights reserved.
//

import UIKit

class detailOne : UIViewController,UIScrollViewDelegate {
    
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var textView: UITextView!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var toolBar: UIToolbar!

    var screenSize : CGRect!
    var textIndex = 0
   
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageView.addSubview(textView)
    
      print(ViewController.contentDetail)
        textView.textAlignment = .center
        textView.text = ViewController.contentDetail[textIndex]
        textView.isUserInteractionEnabled = true
        imageView.isUserInteractionEnabled = true
     
        let swipeRight = UISwipeGestureRecognizer(target : self, action: #selector(self.swipeRecognize(gesture:)))
        swipeRight.direction = .right
        self.imageView.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target : self, action: #selector(self.swipeRecognize(gesture:)))
        swipeLeft.direction = .left
        self.imageView.addGestureRecognizer(swipeLeft)
        let imagePath = Bundle.main.path(forResource:ViewController.images, ofType: "jpg")
        imageView.image = UIImage(contentsOfFile: imagePath!)
   
        }

    func swipeRecognize(gesture : UIGestureRecognizer) {
        
        
    
    if let swipeGesture = gesture as? UISwipeGestureRecognizer {
        
        
        switch swipeGesture.direction {
            
        case UISwipeGestureRecognizerDirection.right:
          
            textIndex = textIndex - 1
            textView.textColor = UIColor.yellow
            if(textIndex < 0) {
                
            textIndex = 0
        
            } else {
            
            animateNextText()
                
            }
        
        case UISwipeGestureRecognizerDirection.left:
            
        textIndex = textIndex + 1
        textView.textColor = UIColor.white
           
            if(textIndex  > ViewController.maxTextCount) {
                
                textIndex = ViewController.maxTextCount
            
            } else {
        
                animateNextText()
           }
            
            
        default:
            break
        }
        
     
        textView.text = ViewController.contentDetail[textIndex]
        
        }
        
    }
    
    @IBAction func share(_ sender: UIButton) {
        
            self.textView.text = ViewController.contentDetail[textIndex]
            let activityViewController : UIActivityViewController = UIActivityViewController(activityItems: [textView.text],applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = (sender)
            activityViewController.excludedActivityTypes = [UIActivityType.assignToContact,UIActivityType.saveToCameraRoll,UIActivityType.copyToPasteboard]
            self.present(activityViewController,animated:true,completion:nil)
        
    }

    func animateNextText()   {
        
        let nextText : String = self.textView.text
        UITextView.transition(with: self.textView, duration: 0.4, options: .transitionFlipFromBottom, animations: { self.textView.text = nextText }, completion: nil)
    }
    

}
