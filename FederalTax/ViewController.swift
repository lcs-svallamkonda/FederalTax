//
//  ViewController.swift
//  FederalTax
//
//  Created by Vallamkonda, Sunaina on 2019-10-31.
//  Copyright © 2019 Vallamkonda, Sunaina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Properties
    @IBOutlet weak var submittedName: UITextField!
    @IBOutlet weak var submittedIncome: UITextField!
    @IBOutlet weak var displayedTaxOwing: UILabel!
    @IBOutlet weak var displayedTaxRatePercentage: UILabel!
    //MARK: Initializers
       
       
    //MARK: Methods (functions) - behaviours
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //will be used to calculate tax
    @IBAction func calculateTaxOwing(_ sender: Any) {
       //retrieve name from view
        guard let name = submittedName.text else{
            displayedTaxOwing.text = "Please enter a name."
            return
        }
       
        //turn income into string
        let incomeAsString = submittedIncome.text!
        
        //turn income string into double value
        let incomeAsDouble = Double(incomeAsString)
        
        //guard against bad input in income text field
        guard let grossIncome = incomeAsDouble else{
            displayedTaxOwing.text = "Please enter your gross income in dollars"
            return
        }
    }
    

}

