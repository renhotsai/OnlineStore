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
    
    
    var id : Int
    var title : String
    var price : Double
    
    init(id: Int, title: String, price: Double) {
        self.id = id
        self.title = title
        self.price = price
    }
    func printReceipt(isRefund: Bool, amount: Double) {
        if isRefund{
            print("""
            -------------------------
            YOUR RECEIPT
            -------------------------
            We are refunding the purchase of Heroes: \(self.title)
            Refund amount: $\(self.price)
            """)
        }else{
            print("""
            -------------------------
            YOUR RECEIPT
            -------------------------
            Thank you for purchasing Heroes: \(self.title)
            Purchase amount: $\(self.price)
            """)
        }
    }
    
}

