
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
        print("Account Reloded with $ \(amount), Current Balance: $ \(self.balance)\n")
    }

    func useItem(id: Int, numMinutes: Int) throws {
        if let index = itemsList.firstIndex(where: { $0.id == id }) {
            itemsList[index].minutesUsed = numMinutes
        } else {
            throw Errors.itemNotFound
        }
    }

}
