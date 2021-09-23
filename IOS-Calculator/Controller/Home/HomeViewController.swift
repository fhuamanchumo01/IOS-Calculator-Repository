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


    }

    
    // Mark buttons actions
    
    @IBAction func operatorACAction(_ sender: UIButton) {
        sender.shine()
    }
    @IBAction func masMenosAction(_ sender: UIButton) {
        sender.shine()
    }
    @IBAction func porcentajeAction(_ sender: UIButton) {
        sender.shine()
    }
    @IBAction func divisionAction(_ sender: UIButton) {
        sender.shine()
    }
    @IBAction func multiplicacionAction(_ sender: UIButton) {
        sender.shine()
    }
    @IBAction func menosAction(_ sender: UIButton) {
        sender.shine()
    }
    @IBAction func masAction(_ sender: UIButton) {
        sender.shine()
    }
    @IBAction func igualAction(_ sender: UIButton) {
        sender.shine()
    }
    @IBAction func numberDecimalAction(_ sender: UIButton) {
        sender.shine()
    }
    
    // numeros
    
    @IBAction func numberAction(_ sender: UIButton) {
        print(sender.tag)
    }
}
