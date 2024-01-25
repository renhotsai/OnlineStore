
class Customer {
    var itemsList: [OwnedItem]
    var balance: Double

    init(itemsList: [OwnedItem] = [], balance: Double = 10.0) {
        self.itemsList = itemsList
        self.balance = balance
    }

    func reloadAccount(amount: Double) throws {
        guard amount > 0 else {
            throw Errors.invalidInput
        }
        balance += amount
        print("\nAccount Reloded with $ \(amount), Current Balance: $ \(self.balance)")
    }

    func useItem(id: Int, numMinutes: Int) {
        if let index = itemsList.firstIndex(where: { $0.id == id }) {
            itemsList[index].minutesUsed = numMinutes
        } else {
            print("Item with ID \(id) not found in the list")
        }
    }

}
