enum TransferStatus{
    case successful
    case failed

}
enum Bank {
    case bancoScotiabank
    case bancoEstado
}

enum AccountType {
    case cuentaCorriente
    case cuentaDeAhorro
    case cuentaVista
}

struct Account{
    let amount : Int
    let number: Int
    let accountType: AccountType
}

struct Transfer {
    var client : Client
    var destinatario : Destinatario
    var identifier : Int
    var status : TransferStatus
}

struct Client {
    var identifier: Int
    var account : Account
    var bank : Bank
    
    func makeTransfer (monto: Int, destinatario: Destinatario) -> Transfer {
        let transfer = Transfer(
            client: self,
            destinatario: destinatario,
            identifier: 7654,
            status: monto > account.amount ? TransferStatus.failed : TransferStatus.successful)
        
        return transfer
    }
    
}

struct Destinatario {
    var identifier: Int
    var bank: Bank
    var numberAccount: Int
}

let client1 = Client(identifier: 123, account: Account(amount: 1000, number: 3456, accountType: .cuentaCorriente), bank: .bancoEstado)
let destinatario = Destinatario(identifier: 336, bank: .bancoScotiabank, numberAccount: 345667)

var transfer = client1.makeTransfer(monto: 1000, destinatario: destinatario)
print(transfer)
