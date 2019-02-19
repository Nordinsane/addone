//
//  ThirdViewController.swift
//  myCalculator
//
//  Created by Kim Nordin on 2019-02-04.
//  Copyright © 2019 kim. All rights reserved.
//

import UIKit
import AVFoundation

class ThirdViewController: UIViewController {
    var gameStarted: Bool = false;
    var timerOn: Bool = false;
    var store: (String,String) = ("","");
    var i = 0;
    var combo = 0;
    var colorRay = [UIColor.red, UIColor.blue, UIColor.yellow, UIColor.green, UIColor.purple];
    let addOne = AddOne(score: 0);
    var audioPlayer: AVAudioPlayer?;
    var time = 61;
    var timer = Timer();
    
    @IBOutlet weak var timerDisplay: UILabel!
    @IBOutlet weak var numDisplay: UILabel!
    @IBOutlet weak var addDisplay: UILabel!
    @IBOutlet weak var scoreDisplay: UILabel!
    @IBOutlet weak var scoreButton: UIButton!
    
    @IBAction func scoreButton(_ sender: UIButton) {
        time = 61
        gameStarted = true
        addDisplay.text = store.0
        addOne.score = 0;
        scoreDisplay.text = String(addOne.score)
        timerOn = true
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ThirdViewController.action), userInfo: nil, repeats: true)
        scoreButton.setTitle("", for: .normal)
        scoreButton.isHidden = true
    }
    
    func score() {
        scoreButton.isHidden = true
    }
    
    @IBAction func numButton(_ sender: UIButton) {
        if(gameStarted){
            if(i < 3) {
                numDisplay.text = numDisplay.text! + String(sender.tag-1)
                i = i+1
            }
            else if(i == 3){
                numDisplay.text = numDisplay.text! + String(sender.tag-1)
                if(numDisplay.text == store.1) {
                    playWinSound();
                    store = addOne.randomNum()
                    addDisplay.text = store.0
                    numDisplay.text = ""
                    addOne.score = addOne.score+5
                    UIView.animate(withDuration: 0.2, delay: 0.0, options: [],
                                   animations: {
                                    self.addDisplay.center.y -= self.view.bounds.height
                    },
                                   completion: nil
                    );
                    scoreDisplay.text = String(addOne.score)
                    UIView.animate(withDuration: 0.2, delay: 0.2, options: [],
                                   animations: {
                                    self.addDisplay.center.y += self.view.bounds.height
                    },
                                   completion: nil
                    );
                    i = 0
                }
                else {
                    playFailSound();
                    numDisplay.text = ""
                    addOne.score = addOne.score-5
                    scoreDisplay.text = String(addOne.score)
                    i = 0
                }
            }
        }
    }

    @objc func action()
    {
        if(timerOn) {
            time -= 1
            timerDisplay.text = String(time)
            if(time == 0) {
                timerOn = false
            }
        }
        else if(!timerOn) {
            i = 0;
            numDisplay.text = ""
            gameStarted = false;
            timer.invalidate()
            scoreButton.setTitle("Grattis! Du fick " + String(addOne.score) + " poäng!", for: .normal)
            scoreButton.isHidden = false
        }
    }
    @IBAction func backChrButton(_ sender: UIButton) {
        
        var str = numDisplay.text
        if((str != "") && (i != 0)) {
            str?.removeLast()
            i = i-1;
        }
        numDisplay.text = str
    }
    func playWinSound(){
        let path = Bundle.main.path(forResource: "zap-bonus.wav", ofType: nil)!
        let url = URL(fileURLWithPath: path)
        do {
            //create your audioPlayer in your parent class as a property
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer!.play()
        } catch {
            print("couldn't load the file")
        }
    }
    func playFailSound(){
        let path = Bundle.main.path(forResource: "negative-noise.wav", ofType: nil)!
        let url = URL(fileURLWithPath: path)
        do {
            //create your audioPlayer in your parent class as a property
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer!.play()
        } catch {
            print("couldn't load the file")
        }
    }
    @IBAction func clearButton(_ sender: UIButton) {
        numDisplay.text = addOne.clear()
        i = 0
    }
    
    override func viewDidLoad() {
        scoreButton.setTitle("Start", for: .normal)
        numDisplay.text = ""
        timerDisplay.text = "";
        store = addOne.randomNum()
        print(store.0, "store0")
        print(store.1, "store1")
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
