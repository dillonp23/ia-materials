//
//  ViewController.swift
//  BullsEye
//
//  Created by Dillon on 9/24/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var slider: UISlider!
    
    var currentValue: Int = 0
    var targetValue: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setupGame()
    }
    
    func setupGame() {
        updateCurrentValue()
        updateTargetValue()
    }
    
    func updateTargetValue() {
        targetValue = Int.random(in: 1...100)
    }
    
    func updateCurrentValue() {
        currentValue = lroundf(slider.value)
    }

    @IBAction func showAlert() {
        let message = "The value of the slider is: \(currentValue)\n The bullseye is at: \(targetValue)"
        let alert = UIAlertController(title: "How'd you do?", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        
        self.present(alert, animated: true) {
            self.updateTargetValue()
        }
    }
    
    @IBAction func sliderValueChanged(_ slider: UISlider) {
        updateCurrentValue()
    }
}
