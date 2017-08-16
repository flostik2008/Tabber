//
//  ViewController.swift
//  Tabber
//
//  Created by Evgeny Vlasov on 8/9/17.
//  Copyright © 2017 Evgeny Vlasov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalLbl: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var justTipLbl: UILabel!
    @IBOutlet weak var controllerToField: NSLayoutConstraint!
    @IBOutlet weak var for2PeopleLbl: UILabel!
    @IBOutlet weak var for3PeopleLbl: UILabel!
    @IBOutlet weak var for4PeopleLbl: UILabel!
    
    var tipPercent: Double!
    var tipValue: Double!
    var opened = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tipControl.addTarget(self, action:#selector(calcTip), for: .valueChanged)
        updateValues()
        
        billField.becomeFirstResponder()
        billField.attributedPlaceholder = NSAttributedString(string: "$", attributes: [NSForegroundColorAttributeName: UIColor(red:0.00, green:0.52, blue:1.00, alpha:1.0)])
        
        navigationController?.navigationBar.barTintColor = UIColor(red:0.00, green:0.52, blue:1.00, alpha:1.0)
        navigationController?.navigationBar.tintColor = UIColor(red:0.51, green:0.74, blue:0.91, alpha:1.0)
    
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "HelveticaNeue-ThinItalic", size:30)!]
        
        NotificationCenter.default.addObserver(self, selector: #selector(closeApp), name: NSNotification.Name.UIApplicationDidEnterBackground, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(openApp), name: NSNotification.Name.UIApplicationWillEnterForeground, object: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        self.controllerToField.constant = 300
        self.view.layoutIfNeeded()

        updateValues()
    }
    
    @IBAction func onTap(_ sender: Any) {
        
        view.endEditing(true)
    }
    
    @IBAction func calcTip(_ sender: Any) {
        
        if billField.text != ""{
        UIView.animate(withDuration: 0.5, animations: {
            self.controllerToField.constant = 20
            self.view.layoutIfNeeded()
            self.opened = true
        })
        } else if billField.text == "" && opened == true {
            UIView.animate(withDuration: 0.5, animations: {
                self.controllerToField.constant = 300
                self.view.layoutIfNeeded()
                self.opened = false
            })

        }
        
        let tipArray = [0.18, 0.20, 0.25]
        
        let bill = Double(billField.text!) ?? 0
        
        if (tipPercent != 0.0) {
            tipValue = bill * tipPercent
        }
        
        tipValue = bill * tipArray[tipControl.selectedSegmentIndex]
        
        let total = bill + tipValue
        justTipLbl.text = String(format: "$%.2f", tipValue)
        totalLbl.text = String(format: "$%.2f", total)
        for2PeopleLbl.text = String(format: "$%.2f", total/2)
        for3PeopleLbl.text = String(format: "$%.2f", total/3)
        for4PeopleLbl.text = String(format: "$%.2f", total/4)
    }
    
    func updateValues() {
    
        let defaults = UserDefaults.standard
        tipPercent = defaults.double(forKey: "default_tip")
 
        let roundedTip = Double(round(100*tipPercent)/100)
        
        if roundedTip == 0.18 {
            tipControl.selectedSegmentIndex = 0
        } else if roundedTip == 0.20 {
            tipControl.selectedSegmentIndex = 1
        } else if roundedTip == 0.25 {
            tipControl.selectedSegmentIndex = 2
        }
        
        calcTip(self)
    }
    
    func closeApp() {
        print("Zhenya: closeApp() func was triggered")
        let closingTime = Date()
        let defaults = UserDefaults.standard
        defaults.set(closingTime, forKey: "closing_time")
    }
    
    func openApp() {
        let openingTime = Date()
        let defaults = UserDefaults.standard
        let closingTime = defaults.object(forKey: "closing_time") as? Date
        if closingTime != nil {
            compareTimes(openingTime, closingTime!)
        }
    }
    
    func compareTimes(_ opening: Date?, _ closing: Date?) {
  
        if (opening!.timeIntervalSinceReferenceDate - closing!.timeIntervalSinceReferenceDate) > 600 {
            resetUI()
        }
    }
    
    func resetUI() {
        billField.text = ""
    }
}

