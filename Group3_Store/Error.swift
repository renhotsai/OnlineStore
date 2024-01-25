//
//  Error.swift
//  Group3_Store
//
//  Created by 이현성 on 1/24/24.
//

import Foundation

enum Errors : Error {
    case itemNotFound
    case alreadyOwnCopy
    case insufficientFund
    case invalidInput
    case usedOver30Min
}
