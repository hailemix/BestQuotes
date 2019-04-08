//
//  detailOne.swift
//  BestQuotes
//
//  Created by user on 9/20/17.
//  Copyright © 2017 Hailemichael. All rights reserved.
//

import UIKit
import GoogleMobileAds
import Crashlytics
import Fabric


class detailOne : UIViewController,UIScrollViewDelegate,GADInterstitialDelegate,GADBannerViewDelegate {
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var textView: UITextView!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var toolBar: UIToolbar!
    var bannerView: GADBannerView!
    var screenSize : CGRect!
    var textIndex = 0
    var interstitial: GADInterstitial!
    static var interstitialCounter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         bannerView = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait)
         addBannerViewToView(bannerView)
         bannerView.adUnitID = "ca-app-pub-9156727777369518/3629976607"
         bannerView.rootViewController = self
         bannerView.load(GADRequest())
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
        
        self.imageView.addSubview(textView)
        textView.textAlignment = .center
        textView.text = ViewController.contentDetail[0]
        textView.isUserInteractionEnabled = true
        imageView.isUserInteractionEnabled = true
        
        let swipeRight = UISwipeGestureRecognizer(target : self, action: #selector(self.swipeRecognize(gesture:)))
        swipeRight.direction = .right
        self.imageView.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target : self, action: #selector(self.swipeRecognize(gesture:)))
        swipeLeft.direction = .left
        self.imageView.addGestureRecognizer(swipeLeft)
        
        let imagePath = Bundle.main.path(forResource:ViewController.images, ofType: "png")
        imageView.image = UIImage(contentsOfFile: imagePath!)
        
        interstitial = createAndLoadInterstitial()

    }

    func addBannerViewToView(_ bannerView: GADBannerView){
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bannerView)
        view.addConstraints([
            NSLayoutConstraint(item: bannerView,
                               attribute: .bottom,
                               relatedBy: .equal,
                               toItem: view,
                               attribute: .top,
                               multiplier: 1,
                               constant: 0),
           NSLayoutConstraint(item: bannerView,
                              attribute: .centerX,
                              relatedBy : .equal,
                              toItem: view,
                              attribute: .centerX,
                              multiplier: 1,
                              constant: 0)
            ])
            }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .default
    }
    
    
    @objc func swipeRecognize(gesture : UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            if(imageView != nil) {
                
                if(textIndex % 8 == 0 && textIndex >= 8) {
                    interstitialForSwipeGesture()
                }
                
                switch swipeGesture.direction {
                    
                case UISwipeGestureRecognizer.Direction.right:
                    
                    textIndex = textIndex - 1
                    textView.textColor = UIColor.yellow
                    if(textIndex < 0) {
                        textIndex = 0
                    } else {
                        animateNextText()
                    }
                    
                case UISwipeGestureRecognizer.Direction.left:
                    
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
        activityViewController.excludedActivityTypes = [UIActivity.ActivityType.assignToContact,UIActivity.ActivityType.saveToCameraRoll,UIActivity.ActivityType.copyToPasteboard]
        self.present(activityViewController,animated:true,completion:nil)
    }
    
    
    func animateNextText()   {
        
        let nextText : String = self.textView.text
        UITextView.transition(with: self.textView, duration: 0.4, options: .transitionFlipFromBottom, animations: { self.textView.text = nextText }, completion: nil)
    }
    
    func createAndLoadInterstitial() -> GADInterstitial {
        
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-9156727777369518/2648067429")
        interstitial.load(GADRequest())
        interstitial.delegate = self
        return interstitial
    }
    
    func interstitialForSwipeGesture() {
        
        if (interstitial != nil) {
            
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
