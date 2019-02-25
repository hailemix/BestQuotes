//
//  ViewController.swift
//  BestQuotes
//
//  Created by user on 9/18/17.
//  Copyright © 2017 Hailemichael. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIViewControllerTransitioningDelegate{
    
    @IBOutlet weak var MyCollectionView: UICollectionView!
    
    var screenSize : CGRect!
    var screenWidth: CGFloat!
    var screenHeight : CGFloat!
    var backDurationTime: Double = 1.0
    var contentFromArray : UITextView!
    var imageIndex = 0
    var gridImages = ["a","b","c","d","e","f","g","h","i","j"]
    var backgroundImages = ["adv","birr","faith","happy","lead","lovely","marri","mix","success","thunder"]
    static var images = ""
    static var contentDetail = [String]()
    static var maxTextCount = 0
    var contentArray = [String]()
    var contentString = ""
    let gridCellIdentifier = "collectionCell"
    let gridToDetailTransition = TransitionAnimation()
    
    enum jsonError: Error {
        
        case failed(String)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.MyCollectionView.delegate = self
        self.MyCollectionView.dataSource = self
        
        screenSize = UIScreen.main.bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return gridImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: gridCellIdentifier, for: indexPath) as! MyCollectionViewCell
        
        cell.myImage.image = UIImage(named: gridImages[indexPath.row])
        return cell
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let myInsets = UIEdgeInsets.init(top: 2, left: 2, bottom: 2, right: 2)
        return (myInsets)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width:(screenWidth/2-4),height: (screenHeight/4))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let detailViewController = self.storyboard?.instantiateViewController(withIdentifier: "detailOne") as! detailOne
        let navigationViewer = UINavigationController (rootViewController: detailViewController)
        navigationViewer.transitioningDelegate = self
        present(navigationViewer, animated: true,completion: nil)
        
        switch indexPath.row {
            
        case 0:
            imageIndex = 0
            contentString = "contentOne"
            ViewController.maxTextCount = 60
            break
            
        case 1:
            imageIndex = 1
            contentString = "contentTwo"
            ViewController.maxTextCount = 71
            break
            
        case 2:
            imageIndex = 2
            contentString = "contentThree"
            ViewController.maxTextCount = 68
            break
            
        case 3:
            imageIndex = 3
            contentString = "contentFour"
            ViewController.maxTextCount = 80
            break
            
        case 4:
            imageIndex = 4
            contentString = "contentFive"
            ViewController.maxTextCount = 64
            break
            
        case 5:
            imageIndex = 5
            contentString = "contentSix"
            ViewController.maxTextCount = 68
            break
            
        case 6:
            imageIndex = 6
            contentString = "contentSeven"
            ViewController.maxTextCount = 68
            break
            
        case 7:
            imageIndex = 7
            contentString = "contentEight"
            ViewController.maxTextCount = 74
            break
        case 8:
            imageIndex = 8
            contentString = "contentNine"
            ViewController.maxTextCount = 83
            break
            
        case 9:
            imageIndex = 9
            contentString = "contentTen"
            ViewController.maxTextCount = 70
            break
            
        default:
            print("There is a problem with index.Please Check the code!")
            
        }
        
        ViewController.images = backgroundImages[imageIndex]
        ViewController.contentDetail = retrieveFromJson()
        
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
         return gridToDetailTransition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return nil
    }
    
    func retrieveFromJson() -> [String] {
        
        do {
            
            if  let file = Bundle.main.url(forResource: "myArray", withExtension: "json"){
                let data = try Data(contentsOf: file)
                let myArray = try JSONSerialization.jsonObject(with: data, options:[])
                
                  if let contentDictionary = myArray as? [String: Any]{
                    
                     contentArray = (contentDictionary[contentString] as? [String])!
                    
                }
            }
            
        }  catch {
            
             print(jsonError.failed("Failed to Serialize Json file"))
            
        }
        
        return contentArray
        
    }
    
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue){
       
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .default
    }
}



