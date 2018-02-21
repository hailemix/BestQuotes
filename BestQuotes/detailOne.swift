//
//  detailOne.swift
//  BestQuotes
//
//  Created by user on 9/20/17.
//  Copyright © 2017 Hailemichael. All rights reserved.
//

import UIKit
import GoogleMobileAds


class detailOne : UIViewController,UIScrollViewDelegate,GADInterstitialDelegate,GADBannerViewDelegate {
    
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var textView: UITextView!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var toolBar: UIToolbar!

    var screenSize : CGRect!
    var textIndex = 0
    var bannerView : GADBannerView!
    var interstitial: GADInterstitial!
    static var interstitialCounter = 0
   
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
         UIApplication.shared.statusBarStyle = .lightContent
        
        
        self.imageView.addSubview(textView)
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
        
        bannerView = GADBannerView(adSize: kGADAdSizeBanner)
         bannerView.adUnitID = "ca-app-pub-9156727777369518/3629976607"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        addBannerViewToView(bannerView)
        interstitial = createAndLoadInterstitial()
        
        }

    func swipeRecognize(gesture : UIGestureRecognizer) {
        
    if let swipeGesture = gesture as? UISwipeGestureRecognizer {
        
        if(textIndex % 5 == 0 && textIndex >= 5) {
            
         interstitialForSwipeGesture()
            
        }
        
        
        if(imageView != nil) {
        
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
    
    func addBannerViewToView(_ bannerView : GADBannerView){
    
    bannerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bannerView)
        
        view.addConstraints([
            
            NSLayoutConstraint(item:bannerView,
            attribute: .top,
            relatedBy: .equal,
            toItem: topLayoutGuide,
            attribute: .top,
            multiplier: 1,
            constant: 65),
            
            NSLayoutConstraint(item:bannerView,
                               attribute: .centerX,
                               relatedBy: .equal,
                               toItem: view,
                               attribute: .centerX,
                               multiplier: 1,
                               constant: 0) ])
    
    }
    
    func createAndLoadInterstitial() -> GADInterstitial {
    
       interstitial = GADInterstitial(adUnitID: "ca-app-pub-9156727777369518/2648067429")          
        interstitial.load(GADRequest())
        interstitial.delegate = self
        return interstitial
    }
    
    func interstitialForSwipeGesture() {
    
        if(interstitial != nil){
        
            if interstitial!.isReady {
                
            interstitial.present(fromRootViewController: self)
            
            } else {
                
            print("Ad is not ready yet!")
            
            }

        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        self.imageView.image = nil
        view.backgroundColor = UIColor.black
        self.textView.text = "Your Phone Memory is busy.Please close other apps."
        interstitialForSwipeGesture()
        
    }

}
