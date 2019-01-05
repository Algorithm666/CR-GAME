//
//  ViewController.swift
//  CR GAME
//
//  Created by Yusif Huseynov on 1/2/19.
//  Copyright © 2019 Yusif Huseynov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    
    @IBAction func startButtonClicked(_ sender: Any) {
        
        performSegue(withIdentifier: "toGameVC", sender: nil)
        
        
    }
    
    @IBAction func helpButtonClicked(_ sender: Any) {
        performSegue(withIdentifier: "toHelpVC", sender: nil)
    }
}

