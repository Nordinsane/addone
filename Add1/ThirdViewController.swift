//
//  ViewController.swift
//  Add1
//
//  Created by Kim Nordin on 2019-02-04.
//  Copyright © 2019 kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var numLabel: UILabel!
    @IBOutlet weak var addLabel: UILabel!
    @IBAction func numButton(_ sender: UIButton) {
        

        
    }
    @IBAction func backButton(_ sender: Any) {
    }
    override func viewDidLoad() {
        addLabel.text = String(solveFor)
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
}

