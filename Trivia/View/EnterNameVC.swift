//
//  EnterNameVC.swift
//  Trivia
//
//  Created by Pallavi on 19/01/21.
//  Copyright © 2021 Pallavi. All rights reserved.
//

import UIKit

class EnterNameVC: UIViewController {

    //MARK:- IBOutlet
    @IBOutlet weak var txtName: UITextField!
    
    //MARK:- View Controller Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        txtName.delegate = self
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        txtName.text = ""
    }
    
    //MARK:- UIButton Action
    @IBAction func tapHistory(_ sender: UIButton) {
        let move = self.storyboard?.instantiateViewController(withIdentifier: "GameHistoryVC") as! GameHistoryVC
        self.navigationController?.pushViewController(move, animated: true)
    }
    
    @IBAction func tapNext(_ sender: UIButton) {
        if validate() {
            let move = self.storyboard?.instantiateViewController(withIdentifier: "ChooseCricketerVC") as! ChooseCricketerVC
            move.userName = txtName.text!
            self.navigationController?.pushViewController(move, animated: true)
        }
    }
    
    //MARK:- Other Helper Methods
    // validate name field
    func validate() -> Bool {
        if txtName.text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) == "" {
            self.showOkAlertWithHandler("Please enter name.") {
                self.txtName.becomeFirstResponder()
            }
            return false
        }
        return true
    }
}

 //MARK:- Extension UITextFieldDelegate
extension EnterNameVC : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
