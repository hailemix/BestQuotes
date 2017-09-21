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
    
    @IBOutlet var pageControl: UIPageControl!
   
    @IBOutlet var textView: UITextView!
    
    
    var dis = ["la","sa","qa","bn","yo","ppp"]

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
      
        self.scrollView.frame = CGRect(x:0,y:0,width:self.view.frame.width,height:self.view.frame.height)
        let scrollViewWidth : CGFloat = self.scrollView.frame.width
        let scrollViewHeight : CGFloat = self.scrollView.frame.height
        
        
        
        let imgOne = UIImageView(frame: CGRect(x:0,y:0,width:scrollViewWidth,height:scrollViewHeight))
        
        imgOne.image = UIImage(named: "success")
        
        textView.text = dis[0]
        textView.textAlignment = .center
        
        
        let imgTwo = UIImageView(frame: CGRect(x:scrollViewWidth,y:0,width:scrollViewWidth,height:scrollViewHeight))
        imgTwo.image = UIImage(named:"success")
        
        let imgThree = UIImageView(frame: CGRect(x:scrollViewWidth*2,y:0,width:scrollViewWidth,height:scrollViewHeight))
        imgThree.image = UIImage(named:"success")
        
        let imgFour = UIImageView(frame: CGRect(x:scrollViewWidth*3,y:0,width:scrollViewWidth,height:scrollViewHeight))
        imgFour.image = UIImage(named:"success")
        
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
        textView.alwaysBounceVertical = true
        
        
        if(pageControl.currentPage==0) {
            
            
            textView.text = dis[0]
            
            
            
        } else if(pageControl.currentPage==1) {
            
            
            textView.text = dis[1]
            
            
        } else if(pageControl.currentPage==2){
            
            textView.text = dis[2]
            
        } else if (pageControl.currentPage==3){
        
            textView.text = dis[3]
        }
        
        
    }
    
   

}
