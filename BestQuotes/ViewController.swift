//
//  ViewController.swift
//  BestQuotes
//
//  Created by user on 9/18/17.
//  Copyright © 2017 Hailemichael. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{

    @IBOutlet weak var MyCollectionView: UICollectionView!
    
    var screenSize : CGRect!
    var screenWidth: CGFloat!
    var screenHeight : CGFloat!


    var images = ["a","b","c","d","e","f","g","h","i","j"]
    let zCellIdentifier = "collectionCell"
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
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
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
  
        // TODO create sectionInsets
        
        return CGSize(width:(screenWidth/2-4),height: (screenHeight/3-3))
    }
    
    
  

}

