//
//  main.swift
//  Group3_Store
//
//  Created by 이현성 on 1/22/24.
//

import Foundation


print("=====================================")
print("Welcome to Group3_Store v1.0")
print("=====================================")
print("This is a simple console application.")
print("Feel free to explore and have fun!")
print("=====================================\n")






//1. Creating a customer
var customer1 = Customer()

//2. Creating a variety of movies and games
var games = [
    Game(title: "CS:GO", price: 2, publisher: "Valve", isMultiplayer: true),
    Game(title: "Among Us", price: 5, publisher: "Innersloth", isMultiplayer: true),
    Game(title: "Rocket League", price: 25, publisher: "Psyonix", isMultiplayer: true),
    Game(title: "Stardew Valley", price: 15, publisher: "ConcernedApe", isMultiplayer: true),
]


var movies = [
    Movie(title: "Inception", price: 12.99, runningTime: 148),
    Movie(title: "The Shawshank Redemption", price: 9.99, runningTime: 142),
    Movie(title: "Pulp Fiction", price: 14.99, runningTime: 154),
    Movie(title: "The Dark Knight", price: 11.99, runningTime: 152),
    Movie(title: "Forrest Gump", price: 10.49, runningTime: 142),
]

//3. Creating a store and adding the movies and games to the store
var store1 = Store(items: (games + movies))

//4. Searching for an item that exists




var action = String()
repeat{
    print("----------------------------------------------------------------------------------------------------")
    print("|  1.search | 2.issue refund | 3.check cart | 4.buy item | 5. use item | 6. Reload fund | 7. exit  |")
    print("----------------------------------------------------------------------------------------------------")
    print("Select one option above: ")
    
    action = readLine()!
    
    var actionInt:Int{
        if Int(action) != nil{
            return Int(action)!
        }else{
            return 0
        }
    }
    
    let menuAction = Menu(rawValue: actionInt)
    switch menuAction {
    case .search:
        print("Search Item: ")
        let searchInput = readLine()!
        do {
            try store1.findByTitle(keyword: searchInput)
        } catch Errors.itemNotFound {
            print("\nPurchase failed: Item with ID \(searchInput) not found in the store.")
        }
        
        action = ""
        break
    case .issueRefund:
        print("Issue refund")
        print("----------------")
        
        for (index, item) in customer1.itemsList.enumerated() {
            print("Item id: \(index + 1) | Item title: \(item.title) | Min used: \(item.minutesUsed)")
        }
        
        print("Select one option above: ")
        let refundItemInput = Int(readLine()!)!
        do {
            try store1.issueRefund(customer: customer1, itemId: refundItemInput)
        } catch Errors.invalidInput {
            print("Input \(refundItemInput) invalid option")
        } catch Errors.usedOver30Min {
            print("Item \(refundItemInput) has been already used over 30 min")
        }
        
        action = ""
        break
    case .checkCart:
        print("Checking cart")
        print("----------------")
        for (index, item) in customer1.itemsList.enumerated() {
            print("Item id: \(index + 1) | Item title: \(item.title) | Min used: \(item.minutesUsed)")
        }
        print("")
        action = ""
        break
    case .buyItem:
        print("Buying Item: ")
        let itemInput = Int(readLine()!)!
        do {
            try store1.buyItem(customer: customer1, itemId: itemInput)
        } catch Errors.itemNotFound {
            print("\nPurchase failed: Item with ID \(itemInput) not found in the store.")
        } catch Errors.insufficientFund {
            let item = try store1.findById(id: itemInput)
            print("Purchase failed: Insufficient funds to buy Item: \(item.title)")
            print("Item price: \(item.price)")
            item.price = customer1.balance
        } catch Errors.alreadyOwnCopy {
            let item = try store1.findById(id: itemInput)
            print("\nPurchase failed: Customer already owns a copy of \(item.title).")
        } catch {
            print("Unexpected error: \(error)")
        }
        action = ""
    case .useItem:
        print("Use Item: ")
        for (index, item) in customer1.itemsList.enumerated() {
            print("Item id: \(index + 1) | Item title: \(item.title) | Min used: \(item.minutesUsed)")
        }
        print("Select one option above: ")
        let itemNum = Int(readLine()!)!
        print("How much minutes you used: ")
        let minUsed = Int(readLine()!)!
        do {
            try customer1.useItem(id: itemNum, numMinutes: minUsed)
        } catch Errors.invalidInput {
            print("Input \(itemNum) invalid option")
        }
        action = ""
    case .reloadFund:
        print("Reload money: ")
        let userInputAmount = Double(readLine()!)!
        do {
            try customer1.reloadAccount(amount: userInputAmount)
            
        } catch Errors.invalidInput {
            print("Input should be greater than 0")
        }
        action = ""
    case .exit:
        print("Terminated...")
        break
    default:
        print("Invalid Input")
        action = ""
        break
    }
} while action == ""



