// Store class

class Store {
    var items: [Item]

    init(items: [Item]) {
        self.items = items
    }

    func buyItem(customer: Customer, itemId: Int) {
        guard let item = items.first(where: { $0.id == itemId }) else {
            print("Purchase failed: Item with ID \(itemId) not found in the store.")
            return
        }

        if customer.itemsList.contains(where: { $0.id == itemId }) {
            print("Purchase failed: Customer already owns a copy of \(item.title).")
        } else if customer.balance >= item.price {
            customer.balance -= item.price
            let newOwnedItem = OwnedItem(id: item.id, title: item.title, price: item.price)
            customer.itemsList.append(newOwnedItem)
            print("Purchase success!")
            newOwnedItem.printReceipt(isRefund: false, amount: customer.balance)
        } else {
            print("Purchase failed: Insufficient funds to buy \(item.title).")
        }
    }

    func issueRefund(customer: Customer, itemId: Int) {
            guard let index = customer.itemsList.firstIndex(where: { $0.id == itemId }) else {
                print("Refund failed: Customer doesn't own the specified item.")
                return
            }

            let refundedItem = customer.itemsList[index]

            if refundedItem.minutesUsed < 30 {
                let refundAmount = refundedItem.price
                customer.balance += refundAmount

                // Display receipt
                refundedItem.printReceipt(isRefund: true, amount: refundAmount)

                // Remove the item
                customer.itemsList.remove(at: index)

                print("Refund successful! \(refundedItem.title) has been removed from customer's owned items.")
            } else {
                print("Refund failed: The item has been used for more than 30 minutes and cannot be refunded.")
            }
        }


    func findByTitle(keyword: String) {
        var found = false
        for item in items {
            if item.title.lowercased().contains(keyword.lowercased()) {
                found = true
                printItemDetails(item)
            }
        }

        if !found {
            print("Sorry, no matching items found.")
        }
    }

    private func printItemDetails(_ item: Item) {
        if let game = item as? Game {
            print("[GAME] \(item.title) $\(item.price)")
            print("Publisher: \(game.publisher)")
            print("Has Multiplayer: \(game.isMultiplayer)")
        } else if let movie = item as? Movie {
            print("[MOVIE] \(item.title) $\(item.price)")
            print("Running Time: \(movie.runningTime) min")
        }
    }
}
