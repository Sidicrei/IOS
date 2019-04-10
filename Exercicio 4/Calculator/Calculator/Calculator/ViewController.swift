import UIKit

class ViewController: UIViewController {
    // MARK: - Outlets

    @IBOutlet private weak var digit0Button: UIButton!
    @IBOutlet private weak var digit1Button: UIButton!
    @IBOutlet private weak var digit2Button: UIButton!
    @IBOutlet private weak var digit3Button: UIButton!
    @IBOutlet private weak var digit4Button: UIButton!
    @IBOutlet private weak var digit5Button: UIButton!
    @IBOutlet private weak var digit6Button: UIButton!
    @IBOutlet private weak var digit7Button: UIButton!
    @IBOutlet private weak var digit8Button: UIButton!
    @IBOutlet private weak var digit9Button: UIButton!
    @IBOutlet private weak var cleanButton: UIButton!
    @IBOutlet private weak var sumOpButton: UIButton!
    @IBOutlet private weak var subtractOpButton: UIButton!
    @IBOutlet private weak var timesOpButton: UIButton!
    @IBOutlet private weak var divideOpButton: UIButton!
    @IBOutlet private weak var equalButton: UIButton!
    @IBOutlet private weak var resultLabel: UILabel!
    var acumulado: Int = 0
    var numClicked: Int = 0
    var click_Num: Bool = false
    var calc: Calculator.Operation!
    var result = false
    
    // MARK: - Stored Properties

    private let calculator = Calculator()

    // MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        registerTouchEvents()
    }

    // MARK: -

    /// Registra o método que será acionado ao tocar em cada um dos eventos.
    private func registerTouchEvents() {
        let digitButtons = [digit0Button, digit9Button, digit8Button,
                            digit7Button, digit6Button, digit5Button,
                            digit4Button, digit3Button, digit2Button,
                            digit1Button]

        let operationButtons = [sumOpButton, subtractOpButton, timesOpButton, divideOpButton]

        digitButtons.forEach { $0?.addTarget(self, action: #selector(digitTap), for: .touchUpInside) }
        operationButtons.forEach { $0?.addTarget(self, action: #selector(operationTap(sender:)), for: .touchUpInside) }
        cleanButton.addTarget(self, action: #selector(clearTap), for: .touchUpInside)
        equalButton.addTarget(self, action: #selector(makeOperation), for: .touchUpInside)
    }

    /// Esse método é responsável por adicionar um dígito na calculadora
    /// - Parameter sender: Referência do botão que está executando a ação
    @objc func digitTap(sender: UIButton) {
        var vlrClique: String?
        switch sender {
        case digit0Button:
            vlrClique =  sender.titleLabel?.text
        case digit1Button:
            vlrClique = sender.titleLabel?.text
        case digit2Button:
            vlrClique = sender.titleLabel?.text
        case digit3Button:
            vlrClique = sender.titleLabel?.text
        case digit4Button:
            vlrClique = sender.titleLabel?.text
        case digit5Button:
            vlrClique = sender.titleLabel?.text
        case digit6Button:
            vlrClique = sender.titleLabel?.text
        case digit7Button:
            vlrClique = sender.titleLabel?.text
        case digit8Button:
            vlrClique = sender.titleLabel?.text
        case digit9Button:
            vlrClique = sender.titleLabel?.text
        case sumOpButton:
            vlrClique = sender.titleLabel?.text
        case subtractOpButton:
            vlrClique = sender.titleLabel?.text
        case timesOpButton:
            vlrClique = sender.titleLabel?.text
        case divideOpButton:
            vlrClique = sender.titleLabel?.text
        case equalButton:
            vlrClique = sender.titleLabel?.text
        case cleanButton:
            vlrClique = sender.titleLabel?.text
            
        default:
            vlrClique = nil
        }
       
        if click_Num == true{
             vlrClique = String(numClicked) + vlrClique!
            numClicked = Int(vlrClique!)!
           
        }else{
             vlrClique = String(acumulado) + vlrClique!
            acumulado = Int(vlrClique!)!
        }
        resultLabel.text = String(Int(vlrClique!)!)
        
    }

    /// Método acionado quando o botão AC é tocado.
    @objc func clearTap() {
        resultLabel.text = "0"
        click_Num = false
        acumulado = 0
    }

    /// Metódo responsável por escolhe qual a operação será realizada.
    /// - Parameter sender: Referência do botão de operação que foi tocado
    @objc func operationTap(sender: UIButton) {
        click_Num = true
        
        switch sender {
        case sumOpButton:
            calc = Calculator.Operation.sum
        case subtractOpButton:
            calc = Calculator.Operation.subtract
        case timesOpButton:
            calc = Calculator.Operation.times
        case divideOpButton:
            calc = Calculator.Operation.divide
        default:
            break
        }
    }

    /// Método acionado quando o botão = é tocado.
    @objc func makeOperation() {
        var resultado: Int = 0
        resultado = calculator.perform(operation: calc, firstValue: acumulado, secondValue: numClicked)
      
        resultLabel.text = String(resultado)
        acumulado = resultado
        numClicked = 0
    }
    
    func sum()-> Int{
        return acumulado + numClicked
    }
    func timesOp()-> Int{
        return acumulado * numClicked
    }
    func divide()-> Int{
        return acumulado / numClicked
    }
    func subtract()-> Int{
        return acumulado - numClicked
    }
}
