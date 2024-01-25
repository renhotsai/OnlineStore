//
//  Movie.swift
//  Group3_Store
//
//  Created by RENHO TSAI on 2024/1/24.
//

import Foundation

class Movie: Item{
    var runningTime : Int = 0
       
    init(title: String, price: Double, runningTime: Int) {
        Item.autoId += 1
        super.init(id: Item.autoId, title: title, price: price)
        self.runningTime = runningTime
    }
    
    override var info: String{
        return """
            \(self.title), $\(self.price)
            Running Time: \(self.runningTime) min
            Item ID: \(self.id)
            """
    }
}
