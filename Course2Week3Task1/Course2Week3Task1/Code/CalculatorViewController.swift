//
//  CalculatorViewController.swift
//  Course2Week3Task1
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUIProperties()
        stepper.stepValue = 0.5
        firstLabel.text = formatNumber(number: Double(stepper.value))
        if let slider = slider {
            secondLabel.text = formatNumber(number: Double(slider.value))
        }
        resultLabel.text = formatNumber(number: stepper.value + Double(slider.value))
    }
    
    func setUIProperties() {
        stepper.layer.borderColor = #colorLiteral(red: 0.9480496049, green: 0.526496172, blue: 0.3553879261, alpha: 1)
        stepper.layer.borderWidth = 1
        stepper.layer.cornerRadius = 4
        stepper.setDecrementImage(stepper.decrementImage(for: .normal), for: .normal)
        stepper.setIncrementImage(stepper.incrementImage(for: .normal), for: .normal)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        slider.frame.size.width = stepper.bounds.width
    }
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        resultLabel.text = formatNumber(number: stepper.value + Double(slider.value))
    }
    
    @IBAction func stepperTapped(_ sender: UIStepper) {
        firstLabel.text = formatNumber(number: Double(stepper.value))
    }
    
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        if let slider = slider {
            secondLabel.text = formatNumber(number: Double(slider.value))
        }
    }
    
    func formatNumber(number: Double) -> String {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 4
        formatter.maximumFractionDigits = 4
        guard let string = formatter.string(from: NSNumber(value: number)) else {
            return "NaN"
        }
        return string
    }
}
