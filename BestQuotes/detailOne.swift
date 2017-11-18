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
    
    var dis = ["ሰዉ አባቱ የነገረዉ ነገር ሁሉ እዉነት መሆኑን በተረዳበት እድሜ ላይ እዉነት እንደሌለ የሚያስብ ልጅ ይኖረዋል፡፡" + "\n" + "\n" + "~ቻርልስ ዋድስዎርዝ~",
        "በማሸነፍና በመሸነፍ መካከል ያለዉ ልዩነት ተስፋ አለመቁረጥ ነዉ፡፡" + "\n" + "\n" + "~ዋልት ዲስኒ~",
        "አንድ ሰዉ ተሳካለት የምለዉ አንዴ በወጣዉ ከፍታ ሳይሆን ህይወቱ ሲዘቅጥ እንደገና ተስፈንጥሮ በወጣዉ ርዝመት ልክ ነዉ"]

    
    override func viewDidLoad() {
        
        
     self.imageView.addSubview(textView)

        super.viewDidLoad()
        
        self.scrollView.frame = CGRect(x:0,y:0,width:self.view.frame.width,height:self.view.frame.height)
        let scrollViewWidth : CGFloat = self.scrollView.frame.width
        let scrollViewHeight : CGFloat = self.scrollView.frame.height
        
        
        
        
        let imgOne = UIScrollView(frame: CGRect(x:0,y:0,width:scrollViewWidth,height:scrollViewHeight))
        
        textView.text = dis[0]
        textView.textAlignment = .center
        
        let imgTwo = UIScrollView(frame: CGRect(x:scrollViewWidth,y:0,width:scrollViewWidth,height:scrollViewHeight))
        
        
        let imgThree = UIScrollView(frame: CGRect(x:scrollViewWidth*2,y:0,width:scrollViewWidth,height:scrollViewHeight))
        
        let imgFour = UIScrollView(frame: CGRect(x:scrollViewWidth*3,y:0,width:scrollViewWidth,height:scrollViewHeight))
      
        self.scrollView.addSubview(imgOne)
        self.scrollView.addSubview(imgTwo)
        self.scrollView.addSubview(imgThree)
        self.scrollView.addSubview(imgFour)
        self.scrollView.contentSize = CGSize(width:self.scrollView.frame.width*4,height:self.scrollView.frame.height)
        self.scrollView.delegate = self
        self.pageControl.currentPage = 0
        self.pageControl.isHidden = true
        self.pageControl.numberOfPages = 4

    }
    
    
    @IBAction func share(_ sender: UIButton) {
       
      
        
        switch pageControl.currentPage {
         
        case 0:
           textView.text = dis[0]
        case 1:
            textView.text = dis[1]
        case 2:
           textView.text = dis[2]
        default:
            print("All the strings are out.")
        }
        
        
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
        
        
        switch pageControl.currentPage {
       
        case 0:
            textView.text = dis[0]
        case 1:
            textView.text = dis[1]
        case 2:
            textView.text = dis[2]
        case 3:
            textView.text = dis[3]
        default:
            print("The items are finished")
        }
      
        
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
