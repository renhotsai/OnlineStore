
class Customer {
    var itemsList: [OwnedItem]
    var balance: Double

    init(itemsList: [OwnedItem] = [], balance: Double = 10.0) {
        self.itemsList = itemsList
        self.balance = balance
    }

    func reloadAccount(amount: Double) {
        balance += amount
        print("\nAccount Reloded with $ \(amount), Current Balance: $ \(self.balance)")
    }

    func useItem(id: Int, numMinutes: Int) {
        guard let index = itemsList.firstIndex(where: { $0.id == id }) else {
            return
        }

        itemsList[index].minutesUsed = numMinutes
        print("\n\(itemsList[index].title) used for \(numMinutes) mins, Total Usage: \(itemsList[index].minutesUsed) minutes")
    }
}
