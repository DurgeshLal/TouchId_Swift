//
//  ViewController.swift
//  TouchID_Swift
//
//  Created by Durgesh Lal on 27/09/14.
//  Copyright (c) 2014 Durgesh Lal. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var btnAuthenticate: UIButton!
    
    @IBAction func authenticateButtonTapped(sender: AnyObject) {
        
        var contex:LAContext = LAContext()
        var errorPointer:NSError?
        
        if contex.canEvaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, error: &errorPointer){
            contex.evaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, localizedReason: "Are You the device owener?", reply: { (success:Bool, error:NSError!) -> Void in
                if (error != nil){
                    
                    var alertView:UIAlertController = UIAlertController(title: "Error", message: "There was a problem verifiying your Identity", preferredStyle:.Alert);
                    let defaultAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
                    alertView.addAction(defaultAction)
                    self.presentViewController(alertView, animated: true, completion: nil)
                    
                }
                
                if success{
                    
                    var alertView:UIAlertController = UIAlertController(title: "Error", message: "You are the device owner", preferredStyle:.Alert);
                    let defaultAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
                    alertView.addAction(defaultAction)
                    self.presentViewController(alertView, animated: true, completion: nil)
                    
                }
                else{
                    var alertView:UIAlertController = UIAlertController(title: "Error", message: "You are not the device owner", preferredStyle:.Alert);
                    let defaultAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
                    alertView.addAction(defaultAction)
                    self.presentViewController(alertView, animated: true, completion: nil)
                }
            })
            
        }
        else{
            var alertView:UIAlertController = UIAlertController(title: "Error", message: "Your device cannot authenticate using TouchID.", preferredStyle:.Alert);
            let defaultAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
            alertView.addAction(defaultAction)
            presentViewController(alertView, animated: true, completion: {
                println("completion closure")
            })
            
            
        }
        
    }
}

