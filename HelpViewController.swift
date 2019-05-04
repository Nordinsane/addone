//
//  HelpViewController.swift
//  AddOne
//
//  Created by Kim Nordin on 2019-02-22.
//  Copyright © 2019 kim. All rights reserved.
//

import UIKit

class HelpViewController: UIViewController {

    @IBOutlet weak var headerDisplay: UILabel!
    @IBOutlet weak var infoTextDisplay: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        infoTextDisplay.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        headerDisplay.text = NSLocalizedString("Welcome to AddOne!", comment: "")
        infoTextDisplay.text = NSLocalizedString("AddOne is a brain-exercise invented by Daniel Kahneman. The goal of AddOne is to add 1 to each number in a String! Should you, for example, get the number 1793 the correct answer would be 2804", comment: "")
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
