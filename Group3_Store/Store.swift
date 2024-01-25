// Store class

class Store {
    var items: [Item]

    init(items: [Item]) {
        self.items = items
    }

    func buyItem(customer: Customer, itemId: Int) throws {
        guard let item = items.first(where: { $0.id == itemId }) else {          
            throw Errors.itemNotFound
        }
        if customer.itemsList.contains(where: { $0.id == itemId }) {
            throw Errors.alreadyOwnCopy
        } else if customer.balance >= item.price {
            customer.balance -= item.price
            let newOwnedItem = OwnedItem(id: item.id ,title: item.title, price: item.price)
            customer.itemsList.append(newOwnedItem)
            print("\nPurchase success!")
            newOwnedItem.printReceipt(isRefund: false, amount: customer.balance)
        } else {
            print("Current Balance: $ \(customer.balance)")
            throw Errors.insufficientFund
        }
    }

    func issueRefund(customer: Customer, itemId: Int) throws {
            guard customer.itemsList.count >= itemId  else {
                throw Errors.invalidInput
            }

            let refundedItem = customer.itemsList[itemId - 1]

            if refundedItem.minutesUsed < 30 {
                let refundAmount = refundedItem.price
                customer.balance += refundAmount

                // Display receipt
                refundedItem.printReceipt(isRefund: true, amount: refundAmount)

                // Remove the item
                customer.itemsList.remove(at: itemId - 1)

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
    
    func findById(id: Int) throws -> Item {
        if let item = items.first(where: { $0.id == id }) {
            return item
        } else {
            throw Errors.itemNotFound
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
