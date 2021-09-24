//
//  HomeViewController.swift
//  IOS-Calculator
//
//  Created by Fernando Huamanchumo on 22/9/21.
//

import UIKit

final class HomeViewController: UIViewController {
    
    
    // operadores
    @IBOutlet weak var buttonResultado: UIButton!
    @IBOutlet weak var buttonSuma: UIButton!
    @IBOutlet weak var buttonDividir: UIButton!
    @IBOutlet weak var buttonMultiplicar: UIButton!
    @IBOutlet weak var buttonResta: UIButton!
    @IBOutlet weak var buttonLimpiar: UIButton!
    @IBOutlet weak var buttonPorcentaje: UIButton!
    @IBOutlet weak var buttonComa: UIButton!
    @IBOutlet weak var buttonMasMenos: UIButton!
    
    // números
    @IBOutlet weak var buttonUno: UIButton!
    @IBOutlet weak var buttonDos: UIButton!
    @IBOutlet weak var buttonTres: UIButton!
    @IBOutlet weak var buttonCuatro: UIButton!
    @IBOutlet weak var buttonCinco: UIButton!
    @IBOutlet weak var buttonSeis: UIButton!
    @IBOutlet weak var buttonSiete: UIButton!
    @IBOutlet weak var buttonOcho: UIButton!
    @IBOutlet weak var buttonNueve: UIButton!
    @IBOutlet weak var buttonCero: UIButton!
    
    // Variables
    @IBOutlet weak var resultLabel: UILabel!
    
    private var total: Double = 0
    private var temp: Double = 0 // valor en pantalla temporal
    private var operating = false // si se selecciona algun operador
    private var decimal = false
    private var operation: OperationType = .none // operacion actual
    
    // constantes
    private let kDecimalSeparator = Locale.current.decimalSeparator!
    private let kMaxLengh = 9

    
    
    private enum OperationType{
        case none, adicion, sustraccion, multiplicacion, division, porcentaje
    }
    
    
    // FORMATEO de valores auxiliar
    private let auxFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = ""
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 100
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 100
        return formatter
    }()
    private let auxTotalFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = ""
        formatter.decimalSeparator = ""
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 100
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 100
        return formatter
    }()
    
    // FORMATEO por defecto
    private let printFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = locale.groupingSeparator
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 9
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 8
        return formatter
    }()
// Formateo en cientifico
    private let printScientificFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .scientific
        formatter.maximumFractionDigits = 3
        formatter.exponentSymbol = "e"
        return formatter
    }()
    
    // MARK: - Initialization
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonUno.round()
        buttonDos.round()
        buttonTres.round()
        buttonCuatro.round()
        buttonCinco.round()
        buttonSeis.round()
        buttonSiete.round()
        buttonOcho.round()
        buttonNueve.round()
        buttonCero.round()
        
        buttonResultado.round()
        buttonDividir.round()
        buttonMultiplicar.round()
        buttonResta.round()
        buttonLimpiar.round()
        buttonPorcentaje.round()
        buttonComa.round()
        buttonMasMenos.round()
        buttonSuma.round()

        buttonComa.setTitle(kDecimalSeparator, for: .normal)
        result()
    }

    
    // Mark buttons actions
    
    @IBAction func operatorACAction(_ sender: UIButton) {
        clear()
        sender.shine()
    }
    @IBAction func masMenosAction(_ sender: UIButton) {
        temp = temp * (-1)
        resultLabel.text = printFormatter.string(from: NSNumber(value: temp))
        sender.shine()
    }
    @IBAction func porcentajeAction(_ sender: UIButton) {
        if operation != .porcentaje{
            result()
        }
        
        operating = true
        operation = .porcentaje
        result()
        sender.shine()
    }
    @IBAction func divisionAction(_ sender: UIButton) {
        if operation != .none{
            result()
        }
        operating = true
        operation = .division
        sender.selectOperation(true)
        sender.shine()
    }
    @IBAction func multiplicacionAction(_ sender: UIButton) {
        if operation != .none{
            result()
        }
        operating = true
        operation = .multiplicacion
        sender.selectOperation(true)
        sender.shine()
    }
    @IBAction func menosAction(_ sender: UIButton) {
        if operation != .none{
            result()
        }
        operating = true
        operation = .sustraccion
        sender.selectOperation(true)
        sender.shine()
    }
    @IBAction func masAction(_ sender: UIButton) {
        
        if operation != .none{
            result()
        }
        operating = true
        operation = .adicion
        sender.selectOperation(true)
        sender.shine()
    }
    @IBAction func igualAction(_ sender: UIButton) {
        result()
        if temp != 0 {
            temp = 0
            total = 0
        }
        sender.shine()
    }
    @IBAction func numberDecimalAction(_ sender: UIButton) {
        let currentTemp = auxTotalFormatter.string(from: NSNumber(value: temp))!
        if !operating && currentTemp.count >= kMaxLengh{
          return
        }
        resultLabel.text = resultLabel.text! + kDecimalSeparator
        
        selectVisualOperation()
        sender.shine()
    }
    
    // numeros
    
    @IBAction func numberAction(_ sender: UIButton) {
        
        buttonLimpiar.setTitle("C", for: .normal)
        var currentTemp = auxTotalFormatter.string(from: NSNumber(value: temp))!
        if !operating && currentTemp.count >= kMaxLengh{
          return
        }
        
        if operating {
            total = total == 0 ? temp : total
            resultLabel.text = ""
            currentTemp = ""
            operating = false
        }
        if decimal{
            currentTemp = "\(currentTemp)\(kDecimalSeparator)"
            decimal = false
        }
        let number = sender.tag
        temp = Double(currentTemp + String(number))!
        resultLabel.text = printFormatter.string(from: NSNumber(value: temp))
        selectVisualOperation()
        sender.shine()
        print(sender.tag)
    }
    
    // esta funcion limpia los valores
    private func clear(){
        operation = .none
        buttonLimpiar.setTitle("AC",for: .normal)
        if temp != 0 {
            temp = 0
            resultLabel.text = "0"
        }else{
            total = 0
            result()
        }
        
    }
    
    private func result(){
        switch operation {
        
        case .none:
            // No se hace nada
            break
        case .adicion:
            total = total + temp
            break
        case .sustraccion:
            total = total - temp
            break
        case .multiplicacion:
            total = total * temp
            break
        case .division:
            total = total / temp
            break
        case .porcentaje:
            total = total / 100
            total = temp * total
            break
        }
        
        if let currentTotal = auxTotalFormatter.string(from: NSNumber(value: total)), currentTotal.count > kMaxLengh{
            resultLabel.text = printScientificFormatter.string(from: NSNumber(value: total))
        }else{
            resultLabel.text = printFormatter.string(from: NSNumber(value: total))
        }
        operation = .none
        selectVisualOperation()
        print(total)
    }
    
    private func selectVisualOperation(){
        if !operating{
            buttonSuma.selectOperation(false)
            buttonResta.selectOperation(false)
            buttonDividir.selectOperation(false)
            buttonMultiplicar.selectOperation(false)
        }
        else {
            switch operation {
            case .none, .porcentaje:
                buttonSuma.selectOperation(false)
                buttonResta.selectOperation(false)
                buttonDividir.selectOperation(false)
                buttonMultiplicar.selectOperation(false)
            
                break
            case .adicion:
                buttonSuma.selectOperation(true)
                buttonResta.selectOperation(false)
                buttonDividir.selectOperation(false)
                buttonMultiplicar.selectOperation(false)
                break
            case .sustraccion:
                buttonSuma.selectOperation(false)
                buttonResta.selectOperation(true)
                buttonDividir.selectOperation(false)
                buttonMultiplicar.selectOperation(false)
                break
            case .multiplicacion:
                buttonSuma.selectOperation(false)
                buttonResta.selectOperation(false)
                buttonDividir.selectOperation(false)
                buttonMultiplicar.selectOperation(true)
                break
            case .division:
                buttonSuma.selectOperation(false)
                buttonResta.selectOperation(false)
                buttonDividir.selectOperation(true)
                buttonMultiplicar.selectOperation(false)
                break
            
        }
    }
    }
}
