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
    
    
    var dis = ["This is the way...Only the Lord Jesus","You're the only one that I can live for ","Nothing is more beautiful than Jesus","owowowowow","never left down at your feet","My savior....wowowowwo"]

    
    override func viewDidLoad() {
        
        
     self.imageView.addSubview(textView)

        super.viewDidLoad()
        
        self.scrollView.frame = CGRect(x:0,y:0,width:self.view.frame.width,height:self.view.frame.height)
        let scrollViewWidth : CGFloat = self.scrollView.frame.width
        let scrollViewHeight : CGFloat = self.scrollView.frame.height
        
         textView.text = dis[0]
        
        
        
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
    
 

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageWidth : CGFloat = scrollView.frame.width
        let currentPage : CGFloat = floor((scrollView.contentOffset.x - pageWidth/2)/pageWidth) + 1
        
        self.pageControl.currentPage = Int(currentPage)
 
        textView.textAlignment = .center
        
       
  
        if(pageControl.currentPage == 0) {

      
            textView.text = dis[0]
 
        }  else if(pageControl.currentPage == 1) {
            
            textView.text = dis[1]
     
        } else if(pageControl.currentPage == 2){
            
            textView.text = dis[2]
            
        } else if (pageControl.currentPage == 3){
        
            textView.text = dis[3]
        }
        
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        fadeOut()
        fadeIn()
    }
    


    func fadeIn() {
        
        UITextView.animate(withDuration: 0.4,delay:0.2,options:[.curveEaseIn],animations: {self.textView.alpha = 1.0;self.textView.frame.origin.y -= 10 },completion : nil)
        
    }
    
    func fadeOut () {
        
        UITextView.animate(withDuration: 0.2,delay:0.2,options:[.curveEaseOut],animations: {self.textView.alpha = 0;self.textView.frame.origin.y += 10 }, completion: nil)
    }
    
   

}
