//
//  ViewController.swift
//  BullsEye
//
//  Created by Dillon on 9/24/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func showAlert() {
        let alert = UIAlertController(title: "Button tapped", message: "You've got my attention", preferredStyle: .alert)
        let nvmAction = UIAlertAction(title: "Nevermind!", style: .default, handler: nil)
        alert.addAction(nvmAction)
        
        self.present(alert, animated: true, completion: nil)
    }

}
