// class Customer

//class Customer {
//    var itemsList: [OwnedItem]
//    var balance: Double
//
//    init(itemsList: [OwnedItem] = [], balance: Double = 10.0) {
//        self.itemsList = itemsList
//        self.balance = balance
//    }
//
//    func reloadAccount(amount: Double) {
//        balance += amount
//    }
//
//    func useItem(id: Int, numMinutes: Int) {
//        guard let index = itemsList.firstIndex(where: { $0.item.id == id }) else {
//            return
//        }
//
//        itemsList[index].useMinutes(numMinutes)
//    }
//}
