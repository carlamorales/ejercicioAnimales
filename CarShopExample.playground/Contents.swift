func UUID() -> String {
    return "1"
}

struct Car {
    let identifier: String
    let brand: String
    let year: Int
}

struct Seller {
    let identifier: String
    let name: String
    
    private func makePayment(value: Int, method: PaymentMethod) -> Payment {
        let payment = Payment(identifier: UUID(), value: 2000000, date: "13/04/2022", status: .accepted, method: .creditCard)
        return payment
    }
    
    func makeSell(
        car: Car,
        client: Client,
        value: Int,
        paymentMethod: PaymentMethod) -> Sell {
        let payment = makePayment(value: value, method: paymentMethod)
        let sell = Sell(identifier: UUID(), car: car, seller: self.identifier, client: client.identifier, payment: payment, status: payment.status == .accepted ? .success : .failed)
        return sell
    }
    
}

struct Client {
    let identifier: String
    let name: String
}

struct Sell {
    let identifier: String
    let car: Car
    let seller: String
    let client: String
    let payment: Payment
    let status: SellStatus
}

struct Payment {
    let identifier: String
    let value: Int
    let date: String
    let status: PaymentStatus
    let method: PaymentMethod
}

enum PaymentStatus {
    case accepted
    case rejected
}

enum SellStatus {
    case success
    case failed
}

enum PaymentMethod {
    case creditCard
    case transfer
    case cash
}
