//
//  ViewController.swift
//  GuessingGame
//
//  Created by Wongso on 27/8/17.
//  Copyright © 2017 wswijaya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var guessedNumber = 0
    var randomNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        generateRandomNumber()
    }

    @IBAction func pickNumber(_ sender: Any) {
        //print((sender as! UIButton).currentTitle ?? "0")
        guessedNumber = Int((sender as! UIButton).currentTitle ?? "0")!
        
        let difference = abs(randomNumber - guessedNumber)
        let title: String
        if (difference == 0) {
            title = "Perfect!"
        } else if (difference < 4) {
            title = "You almost had it!"
        } else {
            title = "Not even close..."
        }
        
        let message = "Random number is \(randomNumber)\n and Your pick is \(guessedNumber)"
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let actionItem = UIAlertAction(title: "OK", style: .default) { [weak self]
            action in
                self?.generateRandomNumber()
        }
        alertController.addAction(actionItem)
        present(alertController, animated: true, completion: nil)
    }
    
    func generateRandomNumber() {
        randomNumber = Int(arc4random_uniform(10)) + 1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

