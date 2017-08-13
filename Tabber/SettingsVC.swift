//
//  SettingsVC.swift
//  Tabber
//
//  Created by Evgeny Vlasov on 8/13/17.
//  Copyright © 2017 Evgeny Vlasov. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var pickerView: UIPickerView!
    
    let pickerData = ["Choose:", "%18", "%20", "%25"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        
        // preset value from UserDefualts. 
        let defaults = UserDefaults.standard
        let tipPercent = defaults.double(forKey: "default_tip")
        if tipPercent == 0.18 {
            pickerView.selectRow(1, inComponent: 0, animated: true)
        } else if tipPercent == 0.20 {
            pickerView.selectRow(2, inComponent: 0, animated: true)
        } else if tipPercent == 0.25 {
            pickerView.selectRow(3, inComponent: 0, animated: true)
        }
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 4
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        print(row)
        
        if row != 0 {
        var percentValue = pickerData[row]
        percentValue = percentValue.replacingOccurrences(of: "%", with: "0.")
        var percentValueDouble = Double(percentValue)
        
        let defaults = UserDefaults.standard
        defaults.set(percentValueDouble, forKey: "default_tip")
        defaults.synchronize()
        }
    }
}







