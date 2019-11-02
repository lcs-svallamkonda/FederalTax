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
        let nameAsString = submittedName.text
        guard let name = nameAsString  else {
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
        //declaring variables for switch statement
        var tax:Double = 0.0
        var tax2:Double = 0.0
        var tax3:Double = 0.0
        var tax4:Double = 0.0
        var tax5:Double = 0.0
       
         //Actual calculations of tax
        switch grossIncome {
        case 210372...:
                tax5 = (grossIncome - 210371) * 0.33
            fallthrough
        case 147668...210371:
            if grossIncome > 210372{
                tax4 = 62704 * 0.29
            } else {
                tax4 = (grossIncome - 147667) * 0.29
            }
            fallthrough
        case 95260...147667:
            if grossIncome > 147667{
                tax3 = 52408 * 0.26
            } else {
                tax3 = (grossIncome - 95259) * 0.26
            }
            fallthrough
        case 47631...95259:
            if grossIncome > 95259{
                tax2 = 47629 * 0.205
            } else {
                tax2 = (grossIncome - 47630) * 0.205
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
        //addition of results
        let totalTax = tax+tax2+tax3+tax4+tax5
       
        // find tax rate percent
        let taxRate = totalTax / incomeAsDouble! * 100
        
        //for testing purposes print name, taxRate and totalTax
        print(name)
        print(taxRate)
        print(totalTax)
        
        //format tax to end at 2 decimal places
        let formattedTax = String(format: "$%.2f", totalTax)
       
        //format taxRate to end at 1 decimal place
        let formattedTaxRate = String(format: "%.1f", taxRate)
        
        //send results to view
        displayedTaxOwing.text = "\(name) your federal tax owing is \(formattedTax)"
        displayedTaxRatePercentage.text = "Effective tax rate is: \(formattedTaxRate)%"
        
    }
}

