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
    var correctAnswer = 0
    var questionCounter = 0
    let maxQuestion = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()

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

    func askQuestion(action: UIAlertAction! = nil) {
        questionCounter += 1
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        title = "Score : \(score) | \(countries[correctAnswer].uppercased())"
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong! That’s the flag of \(countries[sender.tag].uppercased())"
            score -= 1
        }
        
        if questionCounter == maxQuestion {
            questionCounter = 0
            score = 0
            
            title = "Game over - Score \(score)"
            let ac = UIAlertController(title: title, message: nil, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Retry", style: .default, handler: askQuestion))
            present(ac, animated: true)
        }
        else {
            let ac = UIAlertController(title: title, message: nil, preferredStyle: .alert)
            present(ac, animated: true)
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1){
                ac.dismiss(animated: true) {
                    self.askQuestion()
                }
            }
        }
    }
}

