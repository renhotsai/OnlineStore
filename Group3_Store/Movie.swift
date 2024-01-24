//
//  Movie.swift
//  Group3_Store
//
//  Created by RENHO TSAI on 2024/1/24.
//

import Foundation

class Movie: Item{
    private static var autoId = 0
    var runningTime : Int = 0
       
    init(title: String, price: Double, runningTime: Int) {
        Movie.autoId += 1
        super.init(id: Movie.autoId, title: title, price: price)
        self.runningTime = runningTime
    }
    
    override var info: String{
        return """
            \(self.title), $\(self.price)
            Running Time: \(self.runningTime) min
            """
    }
}
