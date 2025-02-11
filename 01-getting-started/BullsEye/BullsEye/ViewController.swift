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
    
    func calculateScore() -> Int {
        let points = 100 - abs(targetValue - currentValue)
        currentScore += points
        return points
    }

    @IBAction func showAlert() {
        let points = calculateScore()
        var title = "How'd you do?"
        var message = "You hit the number \(currentValue), and scored \(points) points!"
        
        if points == 100 {
            title = "BULLSEYE!"
            message = "Way to go - you just scored an extra 100 points!"
        }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Start next round", style: .default) { _ in
            self.setupGame()
        }
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderValueChanged(_ slider: UISlider) {
        updateCurrentValue()
    }
    
    @IBAction func resetGame(_ button: UIButton) {
        roundNumber = 0
        currentScore = 0
        setupGame()
    }
}
