//
//  ViewController.swift
//  Tabber
//
//  Created by Evgeny Vlasov on 8/9/17.
//  Copyright © 2017 Evgeny Vlasov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLbl: UILabel!
    @IBOutlet weak var totalLbl: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    var tipPercent: Double!
    var tipValue: Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tipControl.addTarget(self, action:#selector(calcTip), for: .valueChanged)

        updateValues()
    }

    override func viewWillAppear(_ animated: Bool) {
       
        updateValues()
    }
    
    @IBAction func onTap(_ sender: Any) {
        
        view.endEditing(true)
    }
    
    @IBAction func calcTip(_ sender: Any) {
        
        let tipArray = [0.18, 0.20, 0.25]
        
        let bill = Double(billField.text!) ?? 0
        
        if (tipPercent != 0.0) {
            tipValue = bill * tipPercent
        }
        
        tipValue = bill * tipArray[tipControl.selectedSegmentIndex]
        
        let total = bill + tipValue
        tipLbl.text = String(format: "$%.2f", tipValue)
        totalLbl.text = String(format: "$%.2f", total)
 
    }
    
    func updateValues() {
    
        let defaults = UserDefaults.standard
        tipPercent = defaults.double(forKey: "default_tip")
 
        let roundedTip = Double(round(100*tipPercent)/100)
        print("Zhenya: \(roundedTip)")
        
        if roundedTip == 0.18 {
            tipControl.selectedSegmentIndex = 0
        } else if roundedTip == 0.20 {
            tipControl.selectedSegmentIndex = 1
        } else if roundedTip == 0.25 {
            tipControl.selectedSegmentIndex = 2
        }
        
        calcTip(self)
    }
    
    
}

