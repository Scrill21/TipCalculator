//
//  ResultsViewController.swift
//  TipCalculator
//
//  Created by anthony byrd on 5/17/21.
//

import UIKit

class ResultsViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var totalSplitLabel: UILabel!
    @IBOutlet weak var splitDescriptionLabel: UILabel!
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()

        updateView()
    }
    
    //MARK: - Properties
    var totalCostPerPerson = "0.0"
    var splitBetween = 0
    var percentSplit = 0
    
    //MARK: - Actions
    @IBAction func recalculateButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: - Helper Methods
    func updateView() {
        totalSplitLabel.text = totalCostPerPerson
        splitDescriptionLabel.text = "Split between \(splitBetween) people, with \(percentSplit)% tip"
    }
}
