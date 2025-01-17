//
//  AppDelegate.swift
//  BestQuotes
//
//  Created by user on 9/18/17.
//  Copyright © 2017 Hailemichael. All rights reserved.
//

import UIKit
import UserNotifications
import Firebase
import Fabric
import Crashlytics


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,UNUserNotificationCenterDelegate,MessagingDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
     
          FirebaseApp.configure()
          GADMobileAds.sharedInstance().start(completionHandler: nil)
          application.registerForRemoteNotifications()
    
        if #available(iOS 10.0, *) {
            
            UNUserNotificationCenter.current().delegate = self
            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
            UNUserNotificationCenter.current().requestAuthorization(
                options: authOptions,
                completionHandler: {_, _ in} )
                                }
            
        else {
        
                let setting: UIUserNotificationSettings = UIUserNotificationSettings(
                types: [.alert, .badge, .sound],categories:nil)
                application.registerUserNotificationSettings(setting)
         }
        
        Messaging.messaging().delegate = self
        let token = Messaging.messaging().fcmToken
        print("FCM token: \(token ?? "")")
        Fabric.with([Crashlytics.self])
        
           return true
    }
    
    func messaging(_ messaging : Messaging, didReceiveRegistrationToken fcmToken: String){
        
      print("Firebase registration token: \(fcmToken)")
        
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
   
   

}

