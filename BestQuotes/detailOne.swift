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
    
    var detailOneContent = ["ሰዉ አባቱ የነገረዉ ነገር ሁሉ እዉነት መሆኑን በተረዳበት እድሜ ላይ እዉነት እንደሌለ የሚያስብ ልጅ ይኖረዋል፡፡" + "\n" + "\n" + "~ቻርልስ ዋድስዎርዝ~",
        "በማሸነፍና በመሸነፍ መካከል ያለዉ ልዩነት ተስፋ አለመቁረጥ ነዉ፡፡" + "\n" + "\n" + "~ዋልት ዲስኒ~",
        "አንድ ሰዉ ተሳካለት የምለዉ አንዴ በወጣዉ ከፍታ ሳይሆን ህይወቱ ሲዘቅጥ እንደገና ተስፈንጥሮ በወጣዉ ርዝመት ልክ ነዉ", "በማሸነፍና በመሸነፍ መካከል ያለዉ ልዩነት ተስፋ አለመቁረጥ ነዉ፡፡" + "\n" + "\n" + "~ዋልት ዲስኒ~"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageView.addSubview(textView)
        
      
     self.scrollView.frame = CGRect(x:0,y:0,width:self.view.frame.width,height:self.view.frame.height)
    
        let scrollViewWidth : CGFloat = self.scrollView.frame.width
        let scrollViewHeight : CGFloat = self.scrollView.frame.height
        
      
        
        
        textView.text = detailOneContent[0]
        textView.textAlignment = .center
      
        for  index in 0 ..< 100   {
            
            let k : CGFloat = CGFloat(index)
            let totalImageWidth : CGFloat = k + 1
        
            let imagePosition : UIScrollView = UIScrollView(frame: CGRect(x:scrollViewWidth * k,y:0,width:scrollViewWidth,height:scrollViewHeight))
            self.scrollView.addSubview(imagePosition)
            
            self.scrollView.delegate = self
            self.pageControl.currentPage = 0
            self.pageControl.isHidden = true
            self.pageControl.numberOfPages = Int(totalImageWidth)
            self.scrollView.contentSize = CGSize(width:self.scrollView.frame.width * totalImageWidth,height:self.scrollView.frame.height)
        }


    }
    
    
    @IBAction func share(_ sender: UIButton) {
        
        var textPosition : Int?
        
        switch  pageControl.currentPage  {
       
        case 0:
             textPosition = 0
            
        case 1:
             textPosition = 1
        
        case 2:
             textPosition = 2
            
        case 3:
             textPosition = 3
            
        case 4:
            textPosition = 4
            
        default:
            print("You've reached the total numer of text share!")
            
         
         
        }
        
            textView.text = detailOneContent[textPosition!]
        
            let activityViewController : UIActivityViewController = UIActivityViewController(activityItems: [textView.text],applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = (sender)
            activityViewController.excludedActivityTypes = [UIActivityType.assignToContact,UIActivityType.saveToCameraRoll,UIActivityType.copyToPasteboard]
            self.present(activityViewController,animated:true,completion:nil)
        
        
    }
    
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        

        
        let pageWidth : CGFloat = scrollView.frame.width
        let currentPage : CGFloat = floor((scrollView.contentOffset.x - pageWidth/2)/pageWidth) + 1
        
        self.pageControl.currentPage = Int(currentPage)
 
        textView.textAlignment = .center
        
        var textToBeSwiped : Int?
        switch pageControl.currentPage {
           
        case 0:
            textToBeSwiped = 0
        case 1:
            textToBeSwiped = 1
        case 2:
            textToBeSwiped = 2
        case 3:
           textToBeSwiped  = 3
        default:
            print("The items are finished")
        }
   
        textView.text = detailOneContent[textToBeSwiped!]
    }
    
    
    

    func scrollViewDidScroll(_ scrollView: UIScrollView)
    
    {
        fadeOut()
        fadeIn()
    }

    func fadeIn() {
        
        UITextView.animate(withDuration: 0.12, delay:0.08, options:[.curveEaseIn],animations: {self.textView.alpha = 1.0;self.textView.frame.origin.x -= 15; self.textView.frame.origin.y -= 30 },completion : nil)
        
    }
    
    func fadeOut () {
        
        UITextView.animate(withDuration: 0.10, delay:0.06, options:[.curveEaseOut],animations: {self.textView.alpha = 0.005; self.textView.frame.origin.x += 15 ;self.textView.frame.origin.y += 30 }, completion: nil)
    }
    
     //  Reminder:  Please add SwipeGestureRecognizer in the textView Array

}
