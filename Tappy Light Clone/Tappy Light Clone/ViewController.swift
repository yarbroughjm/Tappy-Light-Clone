//
//  ViewController.swift
//  Tappy Light Clone
//
//  Created by John M. Yarbrough, III on 2/11/18.
//  Copyright © 2018 John Yarbrough. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var trafficLight: UIImageView!
    @IBOutlet weak var timerCounterLabel: UILabel!
    @IBOutlet weak var startStopButton: UIButton!
    
    var timer = Timer()
    var scoreTimer = Timer()
    
    var timerInt = 0
    var scoreInt = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        scoreInt = 0
        timerCounterLabel.text = String(scoreInt)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func StartStop(_ sender: Any) {
        if (scoreInt == 0) {
            timerInt = 3
            
            trafficLight.image = UIImage(named: "Traffic-Light-Off-2400px")
            
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateCounter), userInfo: nil, repeats: true)
            
            startStopButton.isEnabled = false
            startStopButton.setTitle("", for: [])
            
            scoreInt = 0
            timerCounterLabel.text = String(scoreInt)
        } else {
            scoreTimer.invalidate()
        }
        
        if (timerInt == 0) {
            scoreInt = 0
            startStopButton.setTitle("Reset", for: [])
        }
    }
    
    func updateCounter() {
        timerInt -= 1
        
        if (timerInt == 2) {
            trafficLight.image = UIImage(named: "Traffic-Light-Red-2400px")
        } else if (timerInt == 1) {
            trafficLight.image = UIImage(named: "Traffic-Light-Yellow-2400px")
            startStopButton.setTitle("Stop", for: [])
        } else if (timerInt == 0) {
            trafficLight.image = UIImage(named: "Traffic-Light-Green-2400px")
            timer.invalidate()
            startStopButton.isEnabled = true
            scoreTimer = Timer.scheduledTimer(timeInterval: 0.0001, target: self, selector: #selector(ViewController.updateScoreTimer), userInfo: nil, repeats: true)
        }
    }
    
    func updateScoreTimer() {
        scoreInt += 1
        timerCounterLabel.text = String(scoreInt)
    }

}

