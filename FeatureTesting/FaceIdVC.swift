//
//  FaceIdVC.swift
//  FeatureTesting
//
//  Created by Dustin Mahone on 7/8/20.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit
import LocalAuthentication

class FaceIDVC: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        resultLabel.text = ""
    }
        
    @IBAction func signInClicked(_ sender: Any) {
        
        let authContext = LAContext()
        
        var error: NSError?
        
        // checks for faceID or touchID is available on device
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "biometic id for recognition") { (success, error) in
                if success == true {
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "signInSegue", sender: nil)
                    }
                } else {
                    DispatchQueue.main.async {
                        self.resultLabel.text = "try again"
                    }
                    
                }
            }
        }
        
    }
}
