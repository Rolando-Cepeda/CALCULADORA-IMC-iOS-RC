//
//  ViewController.swift
//  CalculadoraIMC-iOS-RC
//
//  Created by Mañanas on 22/7/24.
//

import UIKit

class HomeViewController:UIViewController {
    

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
        //Aqui van las propiedades
    //Para tener las referencias, cuando cambien los valores
    var height: Int = 160
    var weight: Float = 70
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    }
    
        //Aqui van los metodos(Action)

    @IBAction func onHeightChanged(_ sender: UIStepper) {
        //Transformamos un double a entero
        //En Android se utiliza .toInt()
        height = Int(sender.value)
        heightLabel.text = "\(sender.value) cm"
    }
    

    @IBAction func onWeightChanged(_ sender: UISlider) {
        weight = sender.value
        weightLabel.text = "\(sender.value) kg"
    }
    
    
    @IBAction func calculate(_ sender: Any) {
    }
}

