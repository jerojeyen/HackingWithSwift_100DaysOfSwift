//
//  ViewController.swift
//  Project2
//
//  Created by Jerozan Jeyendrarasa on 24/04/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Project 2"
        countries += [
            "estonia",
            "france",
            "germany",
            "ireland",
            "italy",
            "monaco",
            "nigeria",
            "poland",
            "russia",
            "spain",
            "uk",
            "us"
        ]
        
        setButtonUI(button1)
        setButtonUI(button2)
        setButtonUI(button3)
        
        askQuestion()
    }

    func setButtonUI(_ button: UIButton) {
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
    }

    func askQuestion() {
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
    }
    
}

