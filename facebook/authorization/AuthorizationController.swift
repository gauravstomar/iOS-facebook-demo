//
//  ViewController.swift
//  facebook
//
//  Created by Gaurav Singh on 23/08/16.
//  Copyright © 2016 Gaurav Singh. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin

class AuthorizationController: UIViewController, LoginButtonDelegate {

    let loginButton = LoginButton(readPermissions: [ .PublicProfile ])

    override func viewDidLoad() {
        super.viewDidLoad()

        loginButton.center = view.center
        loginButton.delegate = self
        view.addSubview(loginButton)
        
    }

    override func willRotateToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {

        UIView.animateWithDuration(duration/2) {
            self.loginButton.alpha = 0
        }
        
    }
    
    
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {

        UIView.animateWithDuration(0.1) {
            self.loginButton.center = self.view.center
            self.loginButton.alpha = 1
        }

        
    }
    
    
    func loginButtonDidCompleteLogin(loginButton: LoginButton, result: LoginResult) {
        
        AppDelegate.shared().showLanding()
        
    }
    
    
    func loginButtonDidLogOut(loginButton: LoginButton) {
        
        AppDelegate.shared().showAuthorization()
        
    }


}

