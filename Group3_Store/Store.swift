// Store class

class Store {
    var items: [Item]

    init(items: [Item]) {
        self.items = items
    }

    func buyItem(customer: Customer, itemId: Int) {
        guard let item = items.first(where: { $0.id == itemId }) else {
            print("\nPurchase failed: Item with ID \(itemId) not found in the store.")
            return
        }

        if customer.itemsList.contains(where: { $0.id == itemId }) {
            print("\nPurchase failed: Customer already owns a copy of \(item.title).")
        } else if customer.balance >= item.price {
            customer.balance -= item.price
            let newOwnedItem = OwnedItem(id: item.id ,title: item.title, price: item.price)
            customer.itemsList.append(newOwnedItem)
            print("\nPurchase success!")
            newOwnedItem.printReceipt(isRefund: false, amount: customer.balance)
        } else {
            print("\nPurchase failed: Insufficient funds to buy \(item.title).")
            print("Current Balance: $ \(customer.balance)")
        }
    }

    func issueRefund(customer: Customer, itemId: Int) {
            guard let index = customer.itemsList.firstIndex(where: { $0.id == itemId }) else {
                print("\nRefund failed: Customer doesn't own the specified item.")
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

                print("\nRefund successful! \(refundedItem.title) has been removed from customer's owned items.")
            } else {
                print("\nRefund failed: \(refundedItem.title) has been used for more than 30 minutes and cannot be refunded.")
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
            print("\nSorry, no matching items found.")
        }
    }

    private func printItemDetails(_ item: Item) {
        if item is Game {
            print("\nGAME: \(item.info)")
        } else if item is Movie {
            print("\nMOVIE: \(item.info)")
        }
    }
}
