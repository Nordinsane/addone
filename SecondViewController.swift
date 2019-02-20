//
//  SecondViewController.swift
//  myCalculator
//
//  Created by Kim Nordin on 2019-02-01.
//  Copyright © 2019 kim. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var operand: Int = 0;
    var penalty: Int = 0;
    var hassum: Bool = false;
    var clear: Bool = false;
    var mathInteraction = false;
    let math = Math(previousValue: 0, currentValue: 0)

    @IBOutlet weak var numDisplay: UILabel!
    @IBOutlet weak var preNumDisplay: UILabel!
    @IBOutlet weak var clearButton: UIButton!
    
    @IBAction func numButton(_ sender: UIButton) {
        
        if(hassum) {
            numDisplay.text = ""
            hassum = false
        }
        
        if (mathInteraction == false && !hassum) { //Display the values before selecting an operator
            numDisplay.text = numDisplay.text! + String(sender.tag-1)
            math.currentValue = Double(numDisplay.text!)!
        }
            
        else if (mathInteraction == true && !hassum) { //Display the values after selecting an operator
            numDisplay.text = String(sender.tag-1)
            math.currentValue = Double(numDisplay.text!)!
            clearButton.setTitle("C", for: .normal) //När värde tas in ska "AC" ställas om till "C"
            mathInteraction = false
        }
    }
    @IBAction func arithButton(_ sender: UIButton) {
        if numDisplay.text != "" && sender.tag != 11 && sender.tag != 16 {
            
            math.previousValue = math.currentValue
            //Store the previous values after selecting an operator
            
            if(math.previousValue != 0) {
                preNumDisplay.text = String(math.previousValue)
            }
            
            if sender.tag == 12 {
                numDisplay.text = "+"
            }
            else if sender.tag == 13 {
                numDisplay.text = "-"
            }
            else if sender.tag == 14 {
                numDisplay.text = "/"
            }
            else if sender.tag == 15 {
                numDisplay.text = "x"
            }
            operand = sender.tag
            mathInteraction = true
        }
    }
    @IBAction func equalsButton(_ sender: UIButton) {
        let sum = math.calculation(Operand: operand)
        hassum = true
        print(sum)
        //Penalize the number of times the user presses the Equals button
        math.currentValue = sum
        mathInteraction = false
        numDisplay.text = String(sum)
        preNumDisplay.text = ""
    }
    @IBAction func clearButton(_ sender: UIButton) {
        preNumDisplay.text = ""
        let text = math.clear()
        sender.setTitle(text, for: .normal)
        if(math.previousValue == 0) {
            numDisplay.text = ""
            print("första if")
        }
        
        else if(math.currentValue != 0 && math.previousValue != 0) {
            numDisplay.text = String(math.currentValue)
            print("andra if")
        }
        else {
            numDisplay.text = ""
        }
    }
    
    override func viewDidLoad() {
        numDisplay.text = ""
        preNumDisplay.text = ""
        super.viewDidLoad()

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
