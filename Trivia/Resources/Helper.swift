//
//  Helper.swift
//  Trivia
//
//  Created by Pallavi on 19/01/21.
//  Copyright © 2021 Pallavi. All rights reserved.
//

import Foundation
import UIKit

//Error
let failedToSaveData = NSError(domain: "Something went wrong!", code: 1, userInfo: nil)


//MARK:- Date Extension
extension Date {
    func convertToString(_ validDateFormatter:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = validDateFormatter
        return dateFormatter.string(from: self as Date)
    }
}

//MARK:- UIViewController Extension
extension UIViewController {
    
    func showOkAlertWithHandler(_ msg: String,handler: @escaping ()->Void){
        let alert = UIAlertController(title: "Tivia", message: msg, preferredStyle: .alert)
        let okAction = UIAlertAction(title:  "OK", style: .default) { (type) -> Void in
            handler()
        }
        alert.addAction(okAction)
        alert.view.tintColor = UIColor.brown
        present(alert, animated: true, completion: nil)
    }
}
