//
//  ViewController.swift
//  renda
//
//  Created by Emily Nozaki on 2022/01/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var countLabel: UILabel!
    
    @IBOutlet weak var tapButton: UIButton!
    
    var number: Int = 0
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tapButton.layer.cornerRadius = 125
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        number += 1
        countLabel.text = String(number)
    }
    


}

