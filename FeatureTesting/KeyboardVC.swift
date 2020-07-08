//
//  KeyboardVC.swift
//  FeatureTesting
//
//  Created by Dustin Mahone on 7/7/20.
//  Copyright © 2020 Dustin. All rights reserved.
//

import Foundation
import UIKit

class KeyboardVC: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        // keyboard setup
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
        
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
}
