// Primeiro de tudo, vamos criar o protocolo que representará a estrutura da nossa conta.
enum BankOperation{
    case withdrawl(value: Double)
    case deposit(from: String, value: Double)
}

protocol BankAccountProtocol {
    // initilizers
    init(number: String, holder: String)
    
    // Properties
    var balance: Double {get}
    var statement: [BankOperation] {get}
    
    
    
    // Methods
    func withdrawl(value: Double) throws
    func deposit(value: Double, from account: String)
    func formattedStatement() -> String
}

// Como você pode notar, o método withdrawl pode levantar algum erro, nesse caso precisamos
// implementar os erros possíveis do método

enum BankAccountError: Error {
    case insuficientFunds(currentBalance: Double)
}

// Agora vamos implementar a estrutura da classe de acordo com o protocolo:

class MyBank: BankAccountProtocol {
    private let number: String
    private let holder: String
    private(set) var balance: Double
    private(set) var statement :[BankOperation]
    
    required init(number: String, holder: String) {
        self.number = number
        self.holder = holder
        self.balance = 50
        self.statement = []
    }
    
    
    
    
    
    func withdrawl(value: Double) throws {
        if balance >= value {
            balance -= value
            statement.append(BankOperation.withdrawl(value: value))
        }else{
            throw BankAccountError.insuficientFunds(currentBalance: balance)
        }
    }
    
    func deposit(value: Double, from account: String) {
        balance = balance + value
        statement.append(BankOperation.deposit(from: account, value: value))
        
    }
    
    func formattedStatement() -> String {
        var formatado: String = ""
        
        formatado = formataQdeCaracSrtring(value: 10, from: "OPERATION", from: " ") + formataQdeCaracSrtring(value: 10, from: " ", from: " ")
        formatado += formataQdeCaracSrtring(value: 10, from: "VALUE", from: " ") + formataQdeCaracSrtring(value: 10, from: " ", from: " ")
        formatado += formataQdeCaracSrtring(value: 10, from: "FROM", from: " ") + formataQdeCaracSrtring(value: 10, from: " ", from: " ") + "\n"
        formatado += formataQdeCaracSrtring(value: 60, from: "", from: "_") + "\n"
        
        for name in self.statement{
            switch name {
            case let .deposit(from, value):
                formatado += formataQdeCaracSrtring(value: 20, from: " Deposit", from: " ") + formataQdeCaracSrtring(value: 20, from: " "+String(value), from: " ") +
                    formataQdeCaracSrtring(value: 20, from: " "+String(from), from: " ") + "\n"
               
            case let .withdrawl(value):
                formatado += formataQdeCaracSrtring(value: 20, from: " Withdrawl", from: " ") + formataQdeCaracSrtring(value: 20, from: " "+String(value), from: " ") +
                    formataQdeCaracSrtring(value: 20, from: " "+String(self.holder), from: " ") + "\n"
            }

        }
        
        formatado += formataQdeCaracSrtring(value: 20, from: " ", from: "*") + formataQdeCaracSrtring(value: 20, from: "  SALDO " + String(self.balance) + "  ", from: "*") +
            formataQdeCaracSrtring(value: 20, from: "", from: "*") + "\n"

        
        
        // formatado = String(formatado.utf16.count)
        return " \(formatado)"
        
    }
}

func formataQdeCaracSrtring(value: Int, from str_atual: String, from caractterCompletar: String) -> String{
    var str_saida: String = str_atual
    while str_saida.utf16.count < value {
        str_saida += caractterCompletar
    }
    return str_saida
    
}



// Agora precisamos implementar os métodos necessários para começar a trabalhar com a nossa
// conta.






let banco1 = MyBank.init(number: "15", holder: "Conta1")
banco1.deposit(value: 15, from: "CC01")
try banco1.withdrawl(value: 2)


print(banco1.formattedStatement());


// var array : [MyBank] = []
// array.append(banco1)











