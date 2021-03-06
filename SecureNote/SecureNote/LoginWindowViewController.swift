//
//  LoginWindowViewController.swift
//  SecureNote
//
//  Created by Ulad Daratsiuk-Demchuk on 2017-11-07.
//  Copyright © 2017 Uladzislau Daratsiuk. All rights reserved.
//

import UIKit
import LocalAuthentication

class LoginWindowViewController: UIViewController {
    
     let context: LAContext = LAContext()
    
    @IBAction func loginButton(_ sender: Any) {
        
       
        var error: NSError?
        
        if context.canEvaluatePolicy(
            LAPolicy.deviceOwnerAuthentication,
            error: &error) {
            
            
            context.evaluatePolicy(
                LAPolicy.deviceOwnerAuthentication,
                localizedReason: "Access to Notes requires Authentication",
                reply: {(success, error) in
                    DispatchQueue.main.async {
                        
                        if error != nil {
                            switch error!._code {
                            case LAError.Code.systemCancel.rawValue:
                                self.alertUser("Session cancelled",
                                               err: error?.localizedDescription)
                            case LAError.Code.userCancel.rawValue:
                                self.alertUser("Please try again",
                                               err: error?.localizedDescription)
                            case LAError.Code.userFallback.rawValue:
                                self.alertUser("Ups..🙁",
                                               err: "Only Biometric Authentication ")
                            default:
                                self.alertUser("Authentication failed",
                                               err: error?.localizedDescription)
                            }
                            
                        } else {
                            self.performSegue(withIdentifier: "LoginSuccess", sender: self.navigationController)
}
                    }
            })
            
        } else {
            // Device cannot use TouchID
            switch error!.code{
                
            case LAError.Code.biometryNotEnrolled.rawValue:
                alertUser("Biometric device is not enrolled",
                          err: error?.localizedDescription)
                
            case LAError.Code.passcodeNotSet.rawValue:
                alertUser("A passcode has not been set",
                          err: error?.localizedDescription)
                
            default:
                alertUser("Biometric Device not available",
                          err: error?.localizedDescription)
                
            }
        }
        
        
    }
    
    
    @IBAction func touchIdButton(_ sender: Any) {
        
        var error: NSError?
        
        if context.canEvaluatePolicy(
            LAPolicy.deviceOwnerAuthenticationWithBiometrics,
            error: &error) {
            
            
            context.evaluatePolicy(
                LAPolicy.deviceOwnerAuthenticationWithBiometrics,
                localizedReason: "Access to Notes requires Biometric Authentication",
                reply: {(success, error) in
                    DispatchQueue.main.async {
                        
                        if error != nil {
                            switch error!._code {
                            case LAError.Code.systemCancel.rawValue:
                                self.alertUser("Session cancelled",
                                               err: error?.localizedDescription)
                            case LAError.Code.userCancel.rawValue:
                                self.alertUser("Please try again",
                                               err: error?.localizedDescription)
                            case LAError.Code.userFallback.rawValue:
                                self.alertUser("Ups..🙁",
                                               err: "Only Biometric Authentication")
                            default:
                                self.alertUser("Authentication failed",
                                               err: error?.localizedDescription)
                            }
                            
                        } else {
                            self.performSegue(withIdentifier: "LoginSuccess", sender: self.navigationController)
                        }
                    }
            })
            
        }
        
        else  {
            // Device cannot use TouchID
            switch error!.code{
                
            case LAError.Code.biometryNotEnrolled.rawValue:
                alertUser("TouchID is not enrolled",
                          err: error?.localizedDescription)
                
            case LAError.Code.passcodeNotSet.rawValue:
                alertUser("A passcode has not been set",
                          err: error?.localizedDescription)
                
            default:
                alertUser("TouchID not available",
                          err: error?.localizedDescription)
                
            }
        }
        
        
    }
    
    
    
    
    @IBAction func faceIdButton(_ sender: Any) {
        
        var error: NSError?
        
        if context.canEvaluatePolicy(
            LAPolicy.deviceOwnerAuthenticationWithBiometrics,
            error: &error) {
            
            
            context.evaluatePolicy(
                LAPolicy.deviceOwnerAuthenticationWithBiometrics,
                localizedReason: "Access to Notes requires Biometric Authentication",
                reply: {(success, error) in
                    DispatchQueue.main.async {
                        
                        if error != nil {
                            switch error!._code {
                            case LAError.Code.systemCancel.rawValue:
                                self.alertUser("Session cancelled",
                                               err: error?.localizedDescription)
                            case LAError.Code.userCancel.rawValue:
                                self.alertUser("Please try again",
                                               err: error?.localizedDescription)
                            case LAError.Code.userFallback.rawValue:
                                self.alertUser("Ups..🙁",
                                               err: "Only Biometric Authentication")
                            default:
                                self.alertUser("Authentication failed",
                                               err: error?.localizedDescription)
                            }
                            
                        } else {
                            self.performSegue(withIdentifier: "LoginSuccess", sender: self.navigationController)
                        }
                    }
            })
            
        }
            
        else  {
            // Device cannot use FaceID
            switch error!.code{
                
            case LAError.Code.biometryNotEnrolled.rawValue:
                alertUser("FaceID is not enrolled",
                          err: error?.localizedDescription)
                
            case LAError.Code.passcodeNotSet.rawValue:
                alertUser("A passcode has not been set",
                          err: error?.localizedDescription)
                
            default:
                alertUser("FaceID not available",
                          err: error?.localizedDescription)
                
            }
        }
        
        
    }
    
    
    
    func alertUser(_ msg: String, err: String?) {
        let alert = UIAlertController(title: msg,
                                      message: err,
                                      preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "OK",
                                         style: .cancel, handler: nil)
        
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true,
                     completion: nil)
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
   

}
