//
//  ResultViewController.swift
//  Roshambo
//
//  Created by Irene de Mas on 5/20/18.
//  Copyright © 2018 irenedemas. All rights reserved.
//

import UIKit

enum Shape: String {
    case Rock = "💎"
    case Paper = "📄"
    case Scissors = "✂️"
    case Lizard = "🦎"
    case Spock = "🖖"
    
    static func randomShape() -> Shape {
        let shapes = ["💎", "📄", "✂️", "🦎", "🖖"]
        let randomChoice = Int(arc4random_uniform(5))
        return Shape(rawValue: shapes[randomChoice])!
    }
}

class ResultViewController: UIViewController {
    
    @IBOutlet private weak var resultImage: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    
    var userChoice: Shape!
    let opponentChoice: Shape = Shape.randomShape()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        displayResult()
    }
    
    func displayResult() {
        var imageResult: String
        var textResult: String
        let matchup = "\(userChoice.rawValue) vs \(opponentChoice.rawValue)"

        switch (userChoice!, opponentChoice) {
        case let (user, opponent) where user == opponent:
            textResult = "\(matchup): it's a tie!"
            imageResult = "tie"
        case (.Rock, .Scissors), (.Rock, .Lizard), (.Paper, .Rock), (.Paper, .Spock), (.Scissors, .Paper), (.Scissors, .Lizard), (.Lizard, .Paper), (.Lizard, .Spock), (.Spock, .Rock), (.Spock, .Scissors):
            textResult = "You win with \(matchup)!"
            imageResult = "win"
        default:
            textResult = "You lose with \(matchup)!"
            imageResult = "lose"
        }
    
        resultImage.image = UIImage(named: imageResult)
        resultLabel.text = textResult
    }
    
    @IBAction func playAgain() {
        dismiss(animated: true, completion: nil)
    }
    
}
