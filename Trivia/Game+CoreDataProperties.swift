//
//  Game+CoreDataProperties.swift
//  Trivia
//
//  Created by Pallavi on 19/01/21.
//  Copyright © 2021 Pallavi. All rights reserved.
//
//

import Foundation
import CoreData


extension Game {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Game> {
        return NSFetchRequest<Game>(entityName: "Game")
    }

    @NSManaged public var bestCricketer: String?
    @NSManaged public var date: Date?
    @NSManaged public var flagColor: String?
    @NSManaged public var name: String?

}
