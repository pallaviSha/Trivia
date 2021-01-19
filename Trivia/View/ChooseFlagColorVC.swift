//
//  ChooseFlagColorVC.swift
//  Trivia
//
//  Created by Pallavi on 19/01/21.
//  Copyright © 2021 Pallavi. All rights reserved.
//

import UIKit
import CoreData

class ChooseFlagColorVC: UIViewController {

     //MARK:- IBOutlet
    @IBOutlet var btnOptions: [UIButton]!
    
     //MARK:- Other Variables
    var flagColors = ["White" , "Yellow" , "Orange" , "Green"]
    var bestCricketer : String = ""
    var name: String = ""
    
    //MARK:- View Controller Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:- IBButton Tap Action
    @IBAction func tapChooseOptions(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction func tapFinish(_ sender: UIButton) {
        if validate() {
            self.saveGameData { (result) in
                switch result {
                case .success(_):
                    self.retartGame()
                    break
                case .failure(let err):
                    self.showOkAlertWithHandler(err.localizedDescription) {
                    }
                }
            }
        }
    }
    
    //MARK:- Other Helper Methods
    func getFlagColors() -> String {
        var colors : String = ""
        for (i,btn) in btnOptions.enumerated() {
            if btn.isSelected {
                if colors == "" {
                    colors = flagColors[i]
                } else {
                    colors += ",\(flagColors[i])"
                }
            }
        }
        return colors
    }
    
    func retartGame() {
        var nameVc: EnterNameVC?
        for vc in (self.navigationController!.viewControllers) {
            if vc is EnterNameVC {
                nameVc = vc as? EnterNameVC
            }
        }
        
        if nameVc != nil {
            self.navigationController?.popToViewController(nameVc!, animated: true)
        }
        
    }
    
    func validate() -> Bool {
        if getFlagColors() == "" {
            self.showOkAlertWithHandler("Plese select colors for indian national flag.") {
            }
            return false
        }
        return true
    }
}

extension ChooseFlagColorVC {
    func saveGameData(completion: @escaping (Result<Bool, Error>) -> ()) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            completion(.failure(failedToSaveData))
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let game = NSEntityDescription.insertNewObject(forEntityName: "Game", into: managedContext)
        game.setValue(name, forKey: "name")
        game.setValue(getFlagColors(), forKey: "flagColor")
        game.setValue(Date(), forKey: "date")
        game.setValue(bestCricketer, forKey: "bestCricketer")
        do {
            try managedContext.save()
            completion(.success(true))
        } catch {
            completion(.failure(error))
        }
    }
}
