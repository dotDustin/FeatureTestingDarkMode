//
//  KeyboardViewController.swift
//  CustomKeys
//
//  Created by Dustin Mahone on 7/7/20.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //CustomKeys Setup
        let bearButton = UIButton(type: UIButton.ButtonType.system)
        bearButton.frame = CGRect(x: 50, y: 50, width: 80, height: 80)
        bearButton.setBackgroundImage(UIImage(named: "bear.png"), for: .normal)
        bearButton.addTarget(self, action: #selector(customTapped), for: UIControl.Event.touchUpInside)
        view.addSubview(bearButton)
        
        let pigButton = UIButton(type: UIButton.ButtonType.system)
        pigButton.frame = CGRect(x: 150, y: 50, width: 80, height: 80)
        pigButton.setBackgroundImage(UIImage(named: "pig.png"), for: .normal)
        pigButton.addTarget(self, action: #selector(customTapped), for: UIControl.Event.touchUpInside)
        view.addSubview(pigButton)
        
        let wolfButton = UIButton(type: UIButton.ButtonType.system)
        wolfButton.frame = CGRect(x: 250, y: 50, width: 80, height: 80)
        wolfButton.setBackgroundImage(UIImage(named: "wolf.png"), for: .normal)
        wolfButton.addTarget(self, action: #selector(customTapped), for: UIControl.Event.touchUpInside)
        view.addSubview(wolfButton)
        
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton(type: .system)
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        
        self.view.addSubview(self.nextKeyboardButton)
        
        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    @objc func customTapped() {
        let textProxy = textDocumentProxy as UITextDocumentProxy
        textProxy.insertText("custom text here")
    }
    
    override func viewWillLayoutSubviews() {
        self.nextKeyboardButton.isHidden = !self.needsInputModeSwitchKey
        super.viewWillLayoutSubviews()
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.white
        } else {
            textColor = UIColor.black
        }
        self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }

}
