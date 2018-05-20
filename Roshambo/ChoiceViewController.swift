//
//  ChoiceViewController.swift
//  Roshambo
//
//  Created by Irene de Mas on 5/20/18.
//  Copyright © 2018 irenedemas. All rights reserved.
//

import UIKit

class ChoiceViewController: UIViewController {
    
    @IBAction func playRock(_ sender: UIButton) {
        performSegue(withIdentifier: "play", sender: sender)
    }
    
    @IBAction func playPaper(_ sender: UIButton) {
        performSegue(withIdentifier: "play", sender: sender)
    }
    
    @IBAction func playScissors(_ sender: UIButton) {
        performSegue(withIdentifier: "play", sender: sender)
    }
    
    @IBAction func playLizard(_ sender: UIButton) {
        performSegue(withIdentifier: "play", sender: sender)
    }
    
    @IBAction func playSpock(_ sender: UIButton) {
        performSegue(withIdentifier: "play", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "play" {
            let vc = segue.destination as! ResultViewController
            vc.userChoice = getUserShape(sender as! UIButton)
        }
    }
    
    func getUserShape(_ sender: UIButton) -> Shape {
        let shape = sender.title(for: UIControlState())!
        return Shape(rawValue: shape)!
    }

}
