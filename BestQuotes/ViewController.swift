//
//  ViewController.swift
//  BestQuotes
//
//  Created by user on 9/18/17.
//  Copyright © 2017 Hailemichael. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout,UIViewControllerTransitioningDelegate{

    @IBOutlet weak var MyCollectionView: UICollectionView!
    
    var screenSize : CGRect!
    var screenWidth: CGFloat!
    var screenHeight : CGFloat!
    let transition = TransitionAnimation()
    var backDurationTime: Double = 1.0
  


    var images = ["a","b","c","d","e","f","g","h","i","j"]
 

    let zCellIdentifier = "collectionCell"
    
    
 

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.MyCollectionView.delegate = self
        self.MyCollectionView.dataSource = self
        
        screenSize = UIScreen.main.bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        
   
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    
    {
        return images.count
    }
    

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: zCellIdentifier, for: indexPath) as! MyCollectionViewCell

        cell.myImage.image = UIImage(named: images[indexPath.row])
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let myInsets = UIEdgeInsetsMake(2, 2, 2, 2)
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

        
        if(indexPath.row == 0) {
            
            let detailViewController = self.storyboard?.instantiateViewController(withIdentifier: "detailOne") as! detailOne
            let navigationViewer = UINavigationController (rootViewController: detailViewController)
            navigationViewer.transitioningDelegate = self
            navigationViewer.navigationBar.barTintColor = UIColor.black
            present(navigationViewer, animated: true,completion: nil)
            
 }
        
  
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return nil
    }
    
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue){
        
    }

    
        
    }



