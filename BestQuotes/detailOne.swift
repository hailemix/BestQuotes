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

    
    var textIndex = 0
    let maxText = 5
    var detailOneContent = [ "ሰዉ አባቱ የነገረዉ ነገር ሁሉ እዉነት መሆኑን በተረዳበት እድሜ ላይ እዉነት እንደሌለ የሚያስብ ልጅ ይኖረዋል፡፡" + "\n" + "\n" + "~ቻርልስ ዋድስዎርዝ~",
        "በማሸነፍና በመሸነፍ መካከል ያለዉ ልዩነት ተስፋ አለመቁረጥ ነዉ፡፡" + "\n" + "\n" + "~ዋልት ዲስኒ~",
        "አንድ ሰዉ ተሳካለት የምለዉ አንዴ በወጣዉ ከፍታ ሳይሆን ህይወቱ ሲዘቅጥ እንደገና ተስፈንጥሮ በወጣዉ ርዝመት ልክ ነዉ", "Great is the Lord almighty" + "\n" + "\n" + "~ዋልት ዲስኒ~","Help me to glorify your name Lord..nothing more","There is power..power wonder working poer in the blood of the lamb" ]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageView.addSubview(textView)
    
      
        textView.textAlignment = .center
        textView.text = detailOneContent[textIndex]
        textView.isUserInteractionEnabled = true
        imageView.isUserInteractionEnabled = true
     
        let swipeRight = UISwipeGestureRecognizer(target : self, action: #selector(self.swipeRecognize(gesture:)))
        swipeRight.direction = .right
        self.imageView.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target : self, action: #selector(self.swipeRecognize(gesture:)))
        swipeLeft.direction = .left
        self.imageView.addGestureRecognizer(swipeLeft)
   
        }

    
   

  func swipeRecognize(gesture : UIGestureRecognizer) {
    
    
    if let swipeGesture = gesture as? UISwipeGestureRecognizer {
        
       
        
        switch swipeGesture.direction {
        case UISwipeGestureRecognizerDirection.right:
            
    
            if(textIndex != 0) // No animation for initial text Position
            
            {
                
            fadeOutRight()
            fadeInRight()
                
            }
        
            textIndex = textIndex - 1
            if(textIndex < 0) {
                
            textIndex = 0
            
            
            }
            
            textView.text = detailOneContent[textIndex]
            
        case UISwipeGestureRecognizerDirection.left:
            
            if(textIndex != maxText) // No animation for initial text Position
            {
            
            fadeOutLeft()
            fadeInLeft()
                
            }
            
            textIndex = textIndex + 1
           
            if(textIndex  > maxText) {
                
                textIndex = maxText
                
            }
            
            textView.text = detailOneContent[textIndex]
            
        default:
            break
        }
    }

    }
    
    @IBAction func share(_ sender: UIButton) {
        
        
            textView.text = detailOneContent[textIndex]
        
            let activityViewController : UIActivityViewController = UIActivityViewController(activityItems: [textView.text],applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = (sender)
            activityViewController.excludedActivityTypes = [UIActivityType.assignToContact,UIActivityType.saveToCameraRoll,UIActivityType.copyToPasteboard]
            self.present(activityViewController,animated:true,completion:nil)
        
        
    }


    func fadeInLeft() {
        
        UITextView.animate(withDuration: 0.3, delay:0.08, options:[.curveEaseIn],animations: {self.textView.alpha = 1.0;self.textView.frame.origin.x -= 35; self.textView.frame.origin.y -= 30 },completion : nil)
        
        
    }
    
    func fadeOutLeft () {
        
        UITextView.animate(withDuration: 0.10, delay:0.06, options:[.curveEaseOut],animations: {self.textView.alpha = 0.005; self.textView.frame.origin.x += 35 ;self.textView.frame.origin.y += 30 }, completion: nil)
    }
    
    func fadeInRight() {
    
     UITextView.animate(withDuration: 0.3, delay:0.08, options:[.curveEaseIn],animations: {self.textView.alpha = 1.0;self.textView.frame.origin.x += 35; self.textView.frame.origin.y -= 30 },completion : nil)
    }
    
    func fadeOutRight() {
        
         UITextView.animate(withDuration: 0.10, delay:0.06, options:[.curveEaseOut],animations: {self.textView.alpha = 0.005; self.textView.frame.origin.x -= 35 ;self.textView.frame.origin.y += 30 }, completion: nil)
    
    }
    
     //  Reminder:  Please add SwipeGestureRecognizer in the textView Array

}
