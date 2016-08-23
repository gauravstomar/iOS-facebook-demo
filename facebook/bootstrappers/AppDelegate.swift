//
//  AppDelegate.swift
//  facebook
//
//  Created by Gaurav Singh on 23/08/16.
//  Copyright © 2016 Gaurav Singh. All rights reserved.
//

import UIKit
import FBSDKLoginKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    
    var window: UIWindow?

    
    static func shared() -> AppDelegate {

        return UIApplication.sharedApplication().delegate as! AppDelegate

    }
    
    func showLanding() {

        if let window = self.window {
            
            window.rootViewController = UIStoryboard.init(name: "Landing", bundle: nil).instantiateInitialViewController()
            window.makeKeyAndVisible()
            
        }

    }
    
    
    func showAuthorization() {
        
        if let window = self.window {
            
            window.rootViewController = UIStoryboard.init(name: "Authorization", bundle: nil).instantiateInitialViewController()
            window.makeKeyAndVisible()
            
        }
        
    }

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        
        if (FBSDKAccessToken.currentAccessToken() != nil) {

            showLanding()
            return true

        }
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {

    }

    func applicationDidEnterBackground(application: UIApplication) {

    }

    func applicationWillEnterForeground(application: UIApplication) {

    }

    func applicationDidBecomeActive(application: UIApplication) {

        FBSDKAppEvents.activateApp()

    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        
        return FBSDKApplicationDelegate.sharedInstance().application(application, openURL: url, sourceApplication: sourceApplication, annotation: annotation)
        
        
    }
    
    func applicationWillTerminate(application: UIApplication) {

    }


}

