//
//  GameHistoryCell.swift
//  Trivia
//
//  Created by Pallavi on 19/01/21.
//  Copyright © 2021 Pallavi. All rights reserved.
//

import UIKit
import CoreData

class GameHistoryCell: UITableViewCell {

    //MARK:- IBOutlet
    @IBOutlet weak var lblFlagColorValue: UILabel!
    @IBOutlet weak var lblBestCricketerValue: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK:- Other Helper Methods
    func putDataIntoCell(data: NSManagedObject , index: Int) {
        let date = data.value(forKey: "date") as? Date ?? Date()
        lblDate.text = "GAME \(index): \(date.convertToString("dd MMM hh:mm a"))"
        lblName.text = "Name: \(data.value(forKey: "name") as? String ?? "N/A")"
        lblFlagColorValue.text = data.value(forKey: "flagColor") as? String ?? "N/A"
        lblBestCricketerValue.text = data.value(forKey: "bestCricketer") as? String ?? "N/A"
    }
}
