//
//  Landing.swift
//  facebook
//
//  Created by Gaurav Singh on 23/08/16.
//  Copyright © 2016 Gaurav Singh. All rights reserved.
//

import UIKit
import FBSDKCoreKit


class LandingController: UIViewController {

    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userTimezone: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var userAge: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let graphDataRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "timezone, first_name, last_name, birthday, email"])
        
        graphDataRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            
            if ((error) != nil)
            {
                // Process error
                print("Error: \(error)")
            
            } else {

                self.firstName.text = result.valueForKey("first_name") as? String
                self.lastName.text = result.valueForKey("last_name") as? String
                self.userEmail.text = result.valueForKey("email") as? String
                
                //Year calculation
                if let dateString = result.valueForKey("birthday") as? String {
                
                    let dateFormatter = NSDateFormatter()
                    dateFormatter.dateFormat = "dd-MM-yyyy"
                    
                    if let date = dateFormatter.dateFromString(dateString) {
                        let year = NSCalendar.currentCalendar().components(.Year, fromDate: date, toDate: NSDate(), options: []).year
                        self.userAge.text = "\(year) - "
                    }

                } else {
                    
                    self.userAge.text = "N/A - "
                    
                }
                

                if let timezone = result.valueForKey("timezone") as? Double {
                    
                    self.userTimezone.text = "UTC (\(timezone)) - "
                    
                } else {
                    
                    self.userTimezone.text = "N/A - "
                    
                }
                
                let facebookProfileUrl = "https://graph.facebook.com/\(result.valueForKey("id") as! NSString)/picture?type=large"

                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
                    if let url = NSURL(string: facebookProfileUrl) {
                        let data = NSData(contentsOfURL: url)
                        dispatch_async(dispatch_get_main_queue(), {
                            self.profileImage.image = UIImage(data: data!)
                        });
                    }
                }

            }
            
        })

        
        
        
        
    }


}


