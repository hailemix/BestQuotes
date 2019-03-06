//
//  TransitionAnimation.swift
//  BestQuotes
//
//  Created by user on 11/15/17.
//  Copyright © 2017 Hailemichael. All rights reserved.
//

import UIKit

class TransitionAnimation: NSObject,UIViewControllerAnimatedTransitioning,CAAnimationDelegate {
    
    let duration = 1.0
    let presenting = true
    let originFrame = CGRect.zero
    
    
    
    static let kSlideAnimationDuration: CFTimeInterval = 0.6
    
    
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
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let containerView = transitionContext.containerView
        let toView = transitionContext.view(forKey: .to)!
        let fromView = transitionContext.view(forKey: .from)
        let detailView = presenting ? toView : fromView
        
        let initialFrame = presenting ? originFrame : detailView!.frame
        let finalFrame = presenting ? detailView!.frame : originFrame
        
        let xScaleFactor = presenting ?
            
        initialFrame.width / finalFrame.width :
        finalFrame.width / initialFrame.width
        
        let yScaleFactor = presenting ?
        initialFrame.height / finalFrame.height :
        finalFrame.height / initialFrame.height
        
        let scaleTransform = CGAffineTransform(scaleX: xScaleFactor,y: yScaleFactor)
        
        if(presenting) {
            detailView!.transform = scaleTransform
            detailView!.center = CGPoint(x: initialFrame.midX,y: initialFrame.midY)
        }
        containerView.addSubview(toView)
        containerView.bringSubviewToFront(detailView!)
        
        UIView.animate(withDuration: duration, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.0, options: .curveEaseIn,
                       animations: { detailView!.transform = self.presenting ? CGAffineTransform.identity : scaleTransform
                                     detailView!.center = CGPoint(x: finalFrame.midX, y: finalFrame.midY)
                        
                                   },
            completion: { _ in transitionContext.completeTransition(true)
        })
        

}
}

