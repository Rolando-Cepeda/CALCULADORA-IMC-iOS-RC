//
//  ViewController.swift
//  CalculadoraIMC-iOS-RC
//
//  Created by Mañanas on 22/7/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var greeting = "Hello Rolando"
        welcomeLabel.text = greeting
    }


    @IBAction func didClickButton(_ sender: UIButton) {
        welcomeLabel.text = "HAs pulsado el boton"
    }
    
        

}

