//
//  ViewController.swift
//  BullsEye
//
//  Created by Dillon on 9/24/21.
//

import UIKit

class ViewController: UIViewController {
    
    var sliderValue: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func showAlert() {
        let alert = UIAlertController(title: "Button tapped", message: "You've got my attention", preferredStyle: .alert)
        let nvmAction = UIAlertAction(title: "Nevermind!", style: .default, handler: nil)
        alert.addAction(nvmAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderValueChanged(_ slider: UISlider) {
        self.sliderValue = lroundf(slider.value)
        print(self.sliderValue)
    }
}
