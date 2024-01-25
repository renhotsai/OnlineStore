//
//  Game.swift
//  Group3_Store
//
//  Created by RENHO TSAI on 2024/1/24.
//

import Foundation

class Game : Item{
    var publisher: String = ""
    var isMultiplayer:Bool = false
    
    init(title: String, price: Double, publisher: String, isMultiplayer: Bool) {
        Item.autoId += 1
        
        super.init(id: Item.autoId,title: title, price: price)
        self.publisher = publisher
        self.isMultiplayer = isMultiplayer
        
    }
    override var info: String {
        return """
            \(self.title), $\(self.price)
            Publisher: \(self.publisher)
            Is Multiplayerr: \(self.isMultiplayer)
            Item ID: \(self.id)
            """
    }
}

