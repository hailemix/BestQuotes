//
//  ZGridAnimation.swift
//  BestQuotes
//
//  Created by Haile on 3/6/19.
//  Copyright © 2019 Hailemichael. All rights reserved.
//
import UIKit

class ZGridAnimation: UIViewController,CAAnimationDelegate {
    
    static let kSlideAnimationDuration: CFTimeInterval = 0.5
    
    
    static func viewSlideInFromRight(toLeft views: UIView){
        var transition: CATransition? = nil
        transition = CATransition.init()
        transition?.duration = kSlideAnimationDuration
        transition?.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeOut)
        transition?.type = CATransitionType.push
        transition?.subtype = CATransitionSubtype.fromRight
        views.layer.add(transition!, forKey: nil)
    }
    
    static func viewSlideInFromLeft(toRight views: UIView){
        var transition: CATransition? = nil
        transition = CATransition.init()
        transition?.duration = kSlideAnimationDuration
        transition?.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeOut)
        transition?.type = CATransitionType.push
        transition?.subtype = CATransitionSubtype.fromLeft
        views.layer.add(transition!, forKey: nil)
    }
}
