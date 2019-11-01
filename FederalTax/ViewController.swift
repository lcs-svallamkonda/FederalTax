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
      
        //retrieve name from view and protect against bad input
        guard let name = submittedName.text else{
            displayedTaxOwing.text = "Please enter a name."
            return
        }
       
        //turn income into string
        let incomeAsString = submittedIncome.text!
        
        //turn string into double value
        let incomeAsDouble = Double(incomeAsString)
        
        //guard against bad input in income text field
        guard let grossIncome = incomeAsDouble else{
            displayedTaxOwing.text = "Please enter your gross income in dollars"
            return
        }
        
        //Actual calculations of tax
        var tax:Double
        switch grossIncome {
        case 210372...:
            tax = (grossIncome - 210371) * 0.33
            fallthrough
        case 147668...210371:
            if grossIncome > 210372{
                tax = 62704 * 0.29
            } else {
                tax = (grossIncome - 147667) * 0.29
            }
            fallthrough
        case 95260...147667:
            if grossIncome > 147667{
                tax = 52408 * 0.26
            } else {
                tax = (grossIncome - 95259) * 0.26
            }
            fallthrough
        case 47631...95259:
            if grossIncome > 95259{
                tax = 47629 * 0.205
            } else {
            tax = (grossIncome - 47630) * 0.205
            }
            fallthrough
        case 0...47630:
            if grossIncome > 47630{
                tax = 47630 * 0.15
            } else {
            tax = grossIncome * 0.15
            }
        default:
            print("this shouldn't happen")
        }
    }
}

