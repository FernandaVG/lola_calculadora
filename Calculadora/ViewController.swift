//
//  ViewController.swift
//  Calculadora
//
//  Created by alumno on 9/12/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calculadoraOperacion: UILabel!
    
    @IBOutlet weak var calculadoraResultado: UILabel!
    
    var operacion:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eliminarTodo()
    }
    
    func eliminarTodo(){
        operacion = ""
        calculadoraOperacion.text = ""
        calculadoraResultado.text = ""
    }
    
    @IBAction func botonEliminar(_ sender: Any) {
        eliminarTodo()
    }
    
    @IBAction func eliminarCaracter(_ sender: Any) {
        if(!operacion.isEmpty){
            operacion.removeLast()
            calculadoraOperacion.text = operacion
        }
    }
    
    func agregarOperacion(value: String){
        operacion = operacion + value
        calculadoraOperacion.text = operacion
    }
    
    @IBAction func dividir(_ sender: Any) {
        agregarOperacion(value: "/")
    }
    
    @IBAction func multiplicar(_ sender: Any) {
        agregarOperacion(value: "*")
    }
    
    @IBAction func sumar(_ sender: Any) {
        agregarOperacion(value: "+")
    }
    
    @IBAction func restar(_ sender: Any) {
        agregarOperacion(value: "-")
    }
    
    @IBAction func resultado(_ sender: Any) {
        
        
        if(validInput()){
            let expresion = NSExpression(format: operacion)
            let resultado = expresion.expressionValue(with: nil, context: nil) as! Double
            let resultadoString = formatoResultado(resultado: resultado)
            calculadoraResultado.text = resultadoString
        }
        else{
            let alert = UIAlertController(
                title: "Comando inválido",
                message: "La calculadora no puede hacer la operación",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func validInput() -> Bool{
        var conteo = 0
        var caracteresOperacion = [Int]()
        
        for caracter in operacion{
            if(caracteresEspeciales(char: caracter)){
                caracteresOperacion.append(conteo)
            }
            conteo += 1
        }
        
        var previuos: Int = -1
        
        for index in caracteresOperacion{
            if(index == 0){
                return false
            }
            if(index == operacion.count - 1){
                return false
            }
            if(previuos != -1){
                if(index - previuos == 1){
                    return false
                }
            }
        }
        
        return true
    }
    
    func caracteresEspeciales(char: Character) -> Bool{
        if(char == "*")
        {
            return true
        }
        if(char == "/")
        {
            return true
        }
        if(char == "+")
        {
            return true
        }
        
        return false
    }
    
    func formatoResultado(resultado: Double) -> String{
        if(resultado.truncatingRemainder(dividingBy: 1) == 0){
            return String(format: "%.0f", resultado)
        }
        else{
            return String(format: "%.2f", resultado)
        }
    }
    @IBAction func boton0(_ sender: Any) {
        agregarOperacion(value: "0")
    }
    
    @IBAction func botonPunto(_ sender: Any) {
        agregarOperacion(value: ".")
    }
    @IBAction func boton1(_ sender: Any) {
        agregarOperacion(value: "1")
    }
    @IBAction func boton2(_ sender: Any) {
        agregarOperacion(value: "2")
    }
    @IBAction func boton3(_ sender: Any) {
        agregarOperacion(value: "3")
    }
    @IBAction func boton4(_ sender: Any) {
        agregarOperacion(value: "4")
    }
    @IBAction func boton5(_ sender: Any) {
        agregarOperacion(value: "5")
    }
    @IBAction func boton6(_ sender: Any) {
        agregarOperacion(value: "6")
    }
    @IBAction func boton7(_ sender: Any) {
        agregarOperacion(value: "7")
    }
    @IBAction func boton8(_ sender: Any) {
        agregarOperacion(value: "8")
    }
    @IBAction func boton9(_ sender: Any) {
        agregarOperacion(value: "9")
    }
}

