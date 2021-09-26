//
//  ViewController.swift
//  BullsEye
//
//  Created by Dillon on 9/24/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var targetValueLabel: UILabel!
    @IBOutlet var scoreValueLabel: UILabel!
    @IBOutlet var roundValueLabel: UILabel!
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    var currentScore = 0
    var roundNumber = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setupGame()
    }
    
    func setupGame() {
        slider.value = 50
        roundNumber += 1
        updateCurrentValue()
        updateTargetValue()
        updateLabels()
    }
    
    func updateTargetValue() {
        targetValue = Int.random(in: 1...100)
    }
    
    func updateCurrentValue() {
        currentValue = lroundf(slider.value)
    }
    
    func updateLabels() {
        targetValueLabel.text = "\(targetValue)"
        scoreValueLabel.text = "\(currentScore)"
        roundValueLabel.text = "\(roundNumber)"
    }
    
    func calculateScore() {
        let diff = abs(targetValue - currentValue)
        currentScore += 100 - diff
    }

    @IBAction func showAlert() {
        let message = "The value of the slider is: \(currentValue)\n The bullseye is at: \(targetValue)"
        let alert = UIAlertController(title: "How'd you do?", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { _ in
            self.calculateScore()
            self.setupGame()
        }
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderValueChanged(_ slider: UISlider) {
        updateCurrentValue()
    }
}
