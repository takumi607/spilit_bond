//
//  ViewController.swift
//  Project
//
//  Created by 茂木匠 on 2020/5/25.
//  Copyright © 2020 茂木匠. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpElements()
    }
    func setUpElements() {
        
        Utilities.styleFilledButton(LoginButton)
        Utilities.styleFilledButton(signUpButton)
           
       }


}

