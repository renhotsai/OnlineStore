//
//  IsPurchasable.swift
//  Group3_Store
//
//  Created by RENHO TSAI on 2024/1/24.
//

import Foundation

protocol IsPurchasable {
    var info: String { get }
    
    func printReceipt(isRefund:Bool, amount:Double)
}
