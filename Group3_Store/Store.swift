//// Store class
//
//class Store {
//    var items: [Item]
//
//    init(items: [Item]) {
//        self.items = items
//    }
//
//    func buyItem(customer: Customer, itemId: Int) {
//        guard let item = items.first(where: { $0.id == itemId }) else {
//            print("Purchase failed: Item with ID \(itemId) not found in the store.")
//            return
//        }
//
//        if customer.itemsList.contains(where: { $0.item.id == itemId }) {
//            print("Purchase failed: Customer already owns a copy of \(item.title).")
//        } else if customer.balance >= item.price {
//            customer.balance -= item.price
//            let newOwnedItem = OwnedItem(item: item, minutesUsed: 0)
//            customer.itemsList.append(newOwnedItem)
//            print("Purchase success!")
//            newOwnedItem.item.printReceipt(isRefund: false)
//        } else {
//            print("Purchase failed: Insufficient funds to buy \(item.title).")
//        }
//    }
//
//    func issueRefund(customer: Customer, itemId: Int) {
//        customer.issueRefund(itemId: itemId)
//    }
//
//    func findByTitle(keyword: String) {
//        var found = false
//        for item in items {
//            if item.title.lowercased().contains(keyword.lowercased()) {
//                found = true
//                printItemDetails(item)
//            }
//        }
//
//        if !found {
//            print("Sorry, no matching items found.")
//        }
//    }
//
//    private func printItemDetails(_ item: Item) {
//        if let game = item as? Game {
//            print("[GAME] \(item.title) $\(item.price)")
//            print("Publisher: \(game.publisher)")
//            print("Has Multiplayer: \(game.isMultiplayer)")
//        } else if let movie = item as? Movie {
//            print("[MOVIE] \(item.title) $\(item.price)")
//            print("Running Time: \(movie.runningTime) min")
//        }
//    }
//}
