import Foundation

struct Calculator {
    var valorAcumulado: Int = 0
    var numClicked: Int = 0
    var op: String = ""
    var click_Num: Bool = false

    
    enum Operation {
        case sum
        case times
        case divide
        case subtract
    }

    /// Realiza uma operação matemática.
    /// - Parameter operation: Enum com a operação a ser realizada.
    /// - Parameter firstValue: Primeiro valor.
    /// - Parameter secondValue: Segundo valor.
    /// - Returns: Resultado do calculo.
    func perform(operation: Calculator.Operation,
                 firstValue: Int,
                 secondValue: Int) -> Int {
        var valor = 0
        
        switch operation{
        case .sum:
            valor = firstValue + secondValue
        case .subtract:
            valor = firstValue - secondValue
        case .times:
            valor = firstValue * secondValue
        case .divide:
            valor = firstValue / secondValue            
        }
        return valor
    }
    
}
