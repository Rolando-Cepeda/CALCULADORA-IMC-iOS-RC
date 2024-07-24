//
//  ViewController.swift
//  CalculadoraIMC-iOS-RC
//
//  Created by Mañanas on 22/7/24.
//

import UIKit

class HomeViewController:UIViewController {
    
    //El Outlet es como el Binding
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    
    @IBOutlet weak var heightStepper: UIStepper!
    @IBOutlet weak var weightSlider: UISlider!
    
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    //Aqui van las propiedades
    //Para tener las referencias, cuando cambien los valores
    var height: Int = 160
    var weight: Float = 70
    
    //viewDidLoad La vista va a aparecer - onResume
    //viewWillApear La vista ha aparecido
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        heightStepper.value = Double(height)
        weightSlider.value = weight
        
        onHeightChanged(heightStepper)
        onWeightChanged(weightSlider)
        
    }
    
    //Aqui van los metodos(Action)
    //sender.-Hace referencia al valor cuando le den click o muevan el boton.
    //Método que se llama cuando el valor del UIStepper cambia.
    @IBAction func onHeightChanged(_ sender: UIStepper) {
        //Convierte el valor del UIStepper (que es de tipo Double) a Int y lo asigna a la propiedad height.
        height = Int(sender.value)
        //Actualiza el texto del heightLabel para mostrar el nuevo valor de height seguido de " cm".
        heightLabel.text = "\(height) cm"
    }
    
    //Método que se llama cuando el valor del UISlider cambia.
    @IBAction func onWeightChanged(_ sender: UISlider) {
        //Asigna el valor del UISlider (que es de tipo Float) a la propiedad weight.
        weight = sender.value
        //Actualiza el texto del weightLabel para mostrar el nuevo valor de weight seguido de " kg".
        let formatedWeight = String(format: "%.2f", weight)
        weightLabel.text = "\(formatedWeight) kg"
    }
    
    
    @IBAction func calculate(_ sender: Any) {
        //Calculo el IMC
        let imc = Double(weight)/pow(Double(height)/100.0, 2)
        let formatedIMC = String(format: "%.2f", imc)
        
        // Calculo el color y la descripcion
        var descriptionText: String
        var descriptionColor: UIColor
        var descriptionText2: String
        
        
        switch imc {
        case ..<18.5:
            descriptionText = "Peso bajo"
            descriptionColor = UIColor(named: "under_weight")!
            descriptionText2 = "Tu peso es bajo. ¡Una dieta balanceada y saludable puede ayudarte a ganar peso!"
        case 18.5..<24.9:
            descriptionText = "Peso ideal"
            descriptionColor = UIColor(named: "normal_weight")!
            descriptionText2 = "¡Felicitaciones! Tienes un peso ideal. ¡Sigue manteniéndote activo y comiendo saludablemente!"
        case 25..<29.9:
            descriptionText = "Sobrepeso"
            descriptionColor = UIColor(named: "over_weight")!
            descriptionText2 = "Tienes sobrepeso. Considera hacer más ejercicio y llevar una dieta saludable."
        case 30...:
            descriptionText = "Bien gordo"
            descriptionColor = UIColor(named: "obesity_weight")!
            descriptionText2 = "Tu peso está en la categoría de obesidad. Es importante que consultes a un profesional de salud para obtener consejos personalizados."
        default:
            descriptionText = "Desconocido"
            descriptionText2 = "Ha ocurrido un error. Por favor, intenta nuevamente."
            descriptionColor = UIColor.systemRed
        }
        
        // Muestro el resultado
        resultLabel.text = "\(formatedIMC)"
        descriptionLabel.text = "\(descriptionText): \(descriptionText2)"
        resultLabel.textColor = descriptionColor
        descriptionLabel.textColor = descriptionColor
        
        
        
    }
    
    
}
