//
//  CalculatorViewController.swift
//  TipCalculator
//
//  Created by anthony byrd on 5/17/21.
//

import UIKit

class CalculatorViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tenPercentButton: UIButton!
    @IBOutlet weak var fifteenPercentButton: UIButton!
    @IBOutlet weak var twentyPercentButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: - Properties
    var tip = 0.0
    var splitTotal = 0
    var bill = 0.0
    var finalBill = "0.0"
    
    //MARK: - Actions
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        tenPercentButton.isSelected = false
        fifteenPercentButton.isSelected = false
        twentyPercentButton.isSelected = false
        
        sender.isSelected = true
        
        if let currentTitle = sender.currentTitle {
            let dropPctSign = currentTitle.dropLast()
            guard let convertToDouble = Double(dropPctSign) else {return}
            tip = convertToDouble / 100
        }
    }//End of func
    
    @IBAction func stepperButtonTapped(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        
        splitTotal = Int(sender.value)
    }
    
    @IBAction func calculatorButtonPressed(_ sender: UIButton) {
        guard let billAmount = billTextField.text else {return}
        bill = Double(billAmount)!
        let totalBill = bill * (1 + tip) / Double(splitTotal)
        finalBill = String(format: "%.2f", totalBill)
    }
    
    
    //MARK: - Helper Methods
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultsVC" {
            guard let destinationVC = segue.destination as? ResultsViewController else {return}
            destinationVC.totalCostPerPerson = finalBill
            destinationVC.splitBetween = splitTotal
            destinationVC.percentSplit = Int(tip * 100)
        }
    }

}
