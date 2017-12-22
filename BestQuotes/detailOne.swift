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
        "አንድ ሰዉ ተሳካለት የምለዉ አንዴ በወጣዉ ከፍታ ሳይሆን ህይወቱ ሲዘቅጥ እንደገና ተስፈንጥሮ በወጣዉ ርዝመት ልክ ነዉ", "Great is the Lord almighty" + "\n" + "\n" + "~ዋልት ዲስኒ~","Help me to glorify your name Lord..nothing more","There is power..power wonder working power in the blood of the lamb" ]
    
    

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
        
       animateNextText()
        
        switch swipeGesture.direction {
            
        case UISwipeGestureRecognizerDirection.right:
        
            textIndex = textIndex - 1
            if(textIndex < 0) {
                
            textIndex = 0
            
            }
            
            textView.text = detailOneContent[textIndex]
            
        case UISwipeGestureRecognizerDirection.left:
            
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
        
        
            self.textView.text = detailOneContent[textIndex]
        
            let activityViewController : UIActivityViewController = UIActivityViewController(activityItems: [textView.text],applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = (sender)
            activityViewController.excludedActivityTypes = [UIActivityType.assignToContact,UIActivityType.saveToCameraRoll,UIActivityType.copyToPasteboard]
            self.present(activityViewController,animated:true,completion:nil)
        
        
    }


    func animateNextText() {
    
        let nextText : String = self.textView.text
        UITextView.transition(with: self.textView, duration: 0.4, options: .transitionFlipFromBottom, animations: { self.textView.text = nextText }, completion: nil)
        
    }
}
