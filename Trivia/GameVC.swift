//
//  GameVC.swift
//  Trivia
//
//  Created by Pallavi on 19/01/21.
//  Copyright © 2021 Pallavi. All rights reserved.
//

import UIKit

class GameVC: UIViewController {
    
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet var btnAnswers: [UIButton]!
    @IBOutlet weak var btnNext: UIButton!
    
    var isFlagScreen: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
