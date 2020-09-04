//
//  ViewController.swift
//  DojoCalculadora
//
//  Created by Cesar A. Tavares on 31/08/20.
//  Copyright © 2020 Cesar A. Tavares. All rights reserved.
//

import UIKit

// Habilita a opção de definir bordas e suas cores, além de arredondar os cantos dos botões (UIButton), através do menu Atributos
@IBDesignable extension UIButton {
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}

// Habilita a opção de definir bordas e suas cores nos labels (UILabel), através do menu Atributos
@IBDesignable extension UILabel {
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}

// Cria uma extensão para os objetos do tipo Double, onde os transforma em String e remove os zeros depois da vírgula caso seja ".00"
extension Double {
    var clean: String {
       return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var labelMostrador: UILabel!
    var valor1: Double?
    var valor2: Double?
    var resultado: Double?
    var operador: Character?
    var indexVirgula: Bool = false
    var operadorClicado: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    // Verifica se o mostrador apresenta o valor "0" ou se algum botão de operação foi clicado, caso seja verdadeiro substitui o valor do mostrador pelo número clicado. Caso seja falso, concatena os números clicados. Obs.: O código vale para os botões de 0 a 9.
    @IBAction func actionZero(_ sender: UIButton) {
        if labelMostrador.text == "0" || operadorClicado == true {
            labelMostrador.text = "0"
        } else {
            labelMostrador.text = "\(labelMostrador.text!)0"
        }
        operadorClicado = false
    }
    
    @IBAction func actionUm(_ sender: UIButton) {
        if labelMostrador.text == "0" || operadorClicado == true {
            labelMostrador.text = "1"
        } else {
            labelMostrador.text = "\(labelMostrador.text!)1"
        }
        operadorClicado = false
    }
    
    @IBAction func actionDois(_ sender: UIButton) {
        if labelMostrador.text == "0" || operadorClicado == true {
            labelMostrador.text = "2"
        } else {
            labelMostrador.text = "\(labelMostrador.text!)2"
        }
        operadorClicado = false
    }
    
    
    @IBAction func actionTres(_ sender: UIButton) {
        if labelMostrador.text == "0" || operadorClicado == true {
            labelMostrador.text = "3"
        } else {
            labelMostrador.text = "\(labelMostrador.text!)3"
        }
        operadorClicado = false
    }
    
    @IBAction func actionQuatro(_ sender: UIButton) {
        if labelMostrador.text == "0" || operadorClicado == true {
            labelMostrador.text = "4"
        } else {
            labelMostrador.text = "\(labelMostrador.text!)4"
        }
        operadorClicado = false
    }
    
    @IBAction func actionCinco(_ sender: UIButton) {
        if labelMostrador.text == "0" || operadorClicado == true {
            labelMostrador.text = "5"
        } else {
            labelMostrador.text = "\(labelMostrador.text!)5"
        }
        operadorClicado = false
    }
    
    @IBAction func actionSeis(_ sender: UIButton) {
        if labelMostrador.text == "0" || operadorClicado == true {
            labelMostrador.text = "6"
        } else {
            labelMostrador.text = "\(labelMostrador.text!)6"
        }
        operadorClicado = false
    }
    
    @IBAction func actionSete(_ sender: UIButton) {
        if labelMostrador.text == "0" || operadorClicado == true {
            labelMostrador.text = "7"
        } else {
            labelMostrador.text = "\(labelMostrador.text!)7"
        }
        operadorClicado = false
    }
    
    @IBAction func actionOito(_ sender: UIButton) {
        if labelMostrador.text == "0" || operadorClicado == true {
            labelMostrador.text = "8"
        } else {
            labelMostrador.text = "\(labelMostrador.text!)8"
        }
        operadorClicado = false
    }
    
    @IBAction func actionNove(_ sender: UIButton) {
        if labelMostrador.text == "0" || operadorClicado == true {
            labelMostrador.text = "9"
        } else {
            labelMostrador.text = "\(labelMostrador.text!)9"
        }
        operadorClicado = false
    }
    
    // Verifica se o mostrador apresenta o valor "0" ou se algum botão de operação foi clicado, caso seja verdadeiro, adiciona o "0." e aciona o index de vírgula. Caso seja falso, concatena a vírgula ao números clicados. Obs.: O while existe para impedir que a vírgula seja inserida mais de uma vez.
    @IBAction func actionVirgula(_ sender: Any) {
        if labelMostrador.text == "0" || operadorClicado == true {
            labelMostrador.text = "0."
            indexVirgula = true
        } else {
            while !indexVirgula {
                labelMostrador.text = "\(labelMostrador.text!)."
                indexVirgula = true
            }
        }
        operadorClicado = false
    }
    
    
    // Adiciona o valor do label na váriavel valor1, seta o tipo de operação, informa que o botão de operação foi clicado e remove o index da vírgula. Obs.: O código vale para os botões de operação +, - / e *.
    @IBAction func actionSoma(_ sender: UIButton) {
        valor1 = Double(labelMostrador.text!)
        operador = "+"
        operadorClicado = true
        indexVirgula = false
    }
    
    @IBAction func actionSubtrai(_ sender: UIButton) {
        valor1 = Double(labelMostrador.text!)
        operador = "-"
        operadorClicado = true
        indexVirgula = false
    }
    
    @IBAction func actionMultiplica(_ sender: UIButton) {
        valor1 = Double(labelMostrador.text!)
        operador = "*"
        operadorClicado = true
        indexVirgula = false
    }
    
    @IBAction func actionDivide(_ sender: UIButton) {
        valor1 = Double(labelMostrador.text!)
        operador = "/"
        operadorClicado = true
        indexVirgula = false
    }
    
    // Verifica se o 1º valor é diferente de nil. Se for verdadeiro, adiciona o valor do label na variável valor2 e realiza o cálculo. Caso o 1º valor for nil, adiciona o valor do label na variavel valor1 e realiza do cálculo.
    @IBAction func actionPorcentagem(_ sender: UIButton) {
        if valor1 != nil {
            valor2 = Double(labelMostrador.text!)
        } else {
            valor1 = Double(labelMostrador.text!)
            if let valor1 = valor1 {
                resultado = valor1 / 100
                labelMostrador.text = String(resultado!.clean)
            }
            valor1 = nil
        }
        if let valor1 = valor1, let valor2 = valor2 {
            resultado = valor1 * (valor2 / 100)
            labelMostrador.text = String(resultado!.clean)
        }
        indexVirgula = false
    }
    
    // Adiciona o valor do label na variável valor2. Verifica se os valor é diferente de nil. Se for verdadeiro, e realiza o cálculo de acordo com a operação selecionada e zera as variáveis valor 1 e 2.
    @IBAction func actionIgual(_ sender: UIButton) {
        valor2 = Double(labelMostrador.text!)
        if let valor1 = valor1, let valor2 = valor2 {
            if operador == "+" {
                resultado = valor1 + valor2
                labelMostrador.text = String(resultado!.clean)
            } else if operador == "-" {
                resultado = valor1 - valor2
                labelMostrador.text = String(resultado!.clean)
            } else if operador == "*" {
                resultado = valor1 * valor2
                labelMostrador.text = String(resultado!.clean)
            } else if operador == "/" {
                if valor2 == 0 {
                    labelMostrador.text = "Erro"
                } else {
                    resultado = valor1 / valor2
                    labelMostrador.text = String(resultado!.clean)
                }
            } else {
                labelMostrador.text = String(valor2.clean)
        }
            operadorClicado = true
            indexVirgula = false
        }
        valor1 = nil
        valor2 = nil
    }
    
    
    // Reseta os valores das variáveis
    @IBAction func actionAC(_ sender: UIButton) {
        labelMostrador.text = "0"
        valor1 = nil
        valor2 = nil
        indexVirgula = false
        operadorClicado = false
    }
    
}
