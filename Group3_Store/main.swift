//
//  main.swift
//  Group3_Store
//
//  Created by 이현성 on 1/22/24.
//

import Foundation

print("Welcome to Group3_Store")







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

  print("\n1.search | 2.issue refund | 3.check cart | 4.buy item | 5. Reload fund | 6. exit")
  print("Select one option above: ")
  action = readLine()!

    switch action {
    case "1":
        print("Search Item: ")
        let searchInput = readLine()!
        store1.findByTitle(keyword: searchInput)
        action = ""
        break
    case "2":
        print("Issue refund")
        print("----------------")
     
        for (index, item) in customer1.itemsList.enumerated() {
            print("Item id: \(index + 1) | Item title: \(item.title)")
        }
        
        print("Select one option above: ")
        let refundItemInput = Int(readLine()!)!
        
        try store1.issueRefund(customer: customer1, itemId: refundItemInput)
        action = ""
        break
    case "3":
        print("Checking cart")
        print("----------------")
        for (index, item) in customer1.itemsList.enumerated() {
            print("Item id: \(index + 1) | Item title: \(item.title)")

        }
        action = ""
        break
    case "4":
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
    case "5":
        print("Reload money: ")
        let userInputAmount = Double(readLine()!)!
        do {
            try customer1.reloadAccount(amount: userInputAmount)
        
        } catch Errors.invalidInput {
            print("Input should be greater than 0")
        }
        action = ""
    case "6":
        print("Terminated...")
        break
    default:
        print("Invalid Input")
        action = ""
        break
    }
} while action.isEmpty



//4. Searching for an item that exists


//
////5. Searching for an item that does not exist
//store1.findByTitle(keyword: "random game")
//store1.findByTitle(keyword: "unknown movie")
//
//6. Trying to purchase an item that the customer cannot afford
//store1.buyItem(customer: customer1, itemId: 5)
//
////7. Reloading the customer’s gift card so they have sufficient funds
//customer1.reloadAccount(amount: 15.0)
//
////8. Trying to purchase the same item again (now, they should be able to afford it)
//store1.buyItem(customer: customer1, itemId: 5)
//
////9. Purchasing an item that the user does not own
//store1.buyItem(customer: customer1, itemId: 1)
//
////10. Purchasing an item customer already owns
//store1.buyItem(customer: customer1, itemId: 1)
//
////11. Using one of the items for more than 30 minutes
//customer1.useItem(id: (customer1.itemsList.first!.id), numMinutes: 35)
//
////12. Trying to refund an item that does NOT the refund policy requirements
//store1.issueRefund(customer: customer1, itemId: (customer1.itemsList.first!.id))
//
////13. Refunding an item that DOES meet the refund policy requirements
//var refundTestID = customer1.itemsList.last!.id
//store1.issueRefund(customer: customer1, itemId: (customer1.itemsList.last!.id))
//
////14. Test if item has been removed after refund
//store1.buyItem(customer: customer1, itemId: refundTestID)
//
