//
//  ChooseCricketerVC.swift
//  Trivia
//
//  Created by Pallavi on 19/01/21.
//  Copyright © 2021 Pallavi. All rights reserved.
//

import UIKit

class ChooseCricketerVC: UIViewController {
    
    //MARK:- Other Variables
    var previousButtonTap : UIButton?
    var userName: String = ""
    var bestCricketer: String = ""

     //MARK:- View Controller Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:- IBButton Tap Action
    @IBAction func tapOption(_ sender: UIButton) {
        previousButtonTap?.isSelected = false
        bestCricketer = ""
        previousButtonTap = sender
        sender.isSelected = true
        if sender.tag == 0 {
            bestCricketer = "Sachin Tendulkar"
        } else if sender.tag == 1 {
            bestCricketer = "Virat Kolli"
        } else if sender.tag == 2 {
            bestCricketer = "Adam Gilchirst"
        } else {
            bestCricketer = "Jacques Kallis"
        }
    }
    
    @IBAction func tapNext(_ sender: UIButton) {
        if validate() {
            let move = self.storyboard?.instantiateViewController(withIdentifier: "ChooseFlagColorVC") as! ChooseFlagColorVC
            move.name = self.userName
            move.bestCricketer = self.bestCricketer
            self.navigationController?.pushViewController(move, animated: true)
        }
    }
    
    //MARK:- Other Helper Methods
    func validate() -> Bool {
        if bestCricketer == "" {
            self.showOkAlertWithHandler("Please choose best cricketer.") {
            }
            return false
        }
        return true
    }
}
