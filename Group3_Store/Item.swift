//
//  Item.swift
//  Group3_Store
//
//  Created by RENHO TSAI on 2024/1/24.
//

import Foundation

class Item : IsPurchasable{
    var info: String{
        return ""
    }
    
    static var autoId = 0
    var id : Int = Item.autoId
    var title : String
    var price : Double
    
    init(id : Int, title: String, price: Double) {
        self.id = id
        self.title = title
        self.price = price
    }
 
    
    func printReceipt(isRefund: Bool, amount: Double) {
        if isRefund{
            print("""
            \n-------------------------
            YOUR RECEIPT
            -------------------------
            We are refunding the purchase: \(self.title)
            Refund amount: $\(self.price)
            """)
        }else{
            print("""
            \n-------------------------
            YOUR RECEIPT
            -------------------------
            Thank you for purchasing: \(self.title)
            Purchase amount: $\(self.price)
            """)
        }
    }
    
}

