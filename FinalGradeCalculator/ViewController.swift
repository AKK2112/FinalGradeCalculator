//
//  ViewController.swift
//  FinalGradeCalculator
//
//  Created by Alec Kinzie on 10/26/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currentGradeLabel: UILabel!
    @IBOutlet weak var desiredFinalGradeLabel: UILabel!
    @IBOutlet weak var examWorthLabel: UILabel!
    @IBOutlet var currentGradeInput: UITextField!
    @IBOutlet var desiredFinalGradeInput: UITextField!
    @IBOutlet var examWorthInput: UITextField!
    @IBOutlet weak var Calculate: UILabel!
    @IBOutlet weak var GradeDisplayer: UILabel!
    @IBOutlet weak var extraCredit: UILabel!
    @IBOutlet weak var desiredGradeSegmented: UISegmentedControl!
    @IBOutlet weak var picker: UIPickerView!
    
    
    var pickerData = ["90", "80", "70", "60"]
    
    
    var pickerView = UIPickerView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentGradeLabel.text = " Enter Current Grade"
        desiredFinalGradeLabel.text = " Enter Desired Grade"
        examWorthLabel.text = "Enter Exam Worth"
        Calculate.text = "Tap to Calculate!"
        GradeDisplayer.text = ""
        extraCredit.text = ""
        
        
        picker.delegate = self
        picker.dataSource = self
        
        

    }

    @IBAction func onFinalGradeTapped(_ sender: UITapGestureRecognizer) {
       //MARK: MVP

        let currentGradeInput = currentGradeInput.text!
        let desiredFinalGradeInput = desiredFinalGradeInput.text!
        let examWorthInput = examWorthInput.text!
        let currentGradeDouble = Double(currentGradeInput)!
        let desiredGradeDouble = Double(desiredFinalGradeInput)!
        let examWorthDoubleA = Double(examWorthInput)!
        let examWorthPercent = Double(examWorthDoubleA/100)
        
        
        
        let totalDouble = (desiredGradeDouble-((1-examWorthPercent)*currentGradeDouble)) / (examWorthPercent)
        let result = Int(totalDouble)
        
        
        
        GradeDisplayer.text = "You need to get a " + "\(result)" + "% on your final exam to get an " + "\(desiredGradeDouble)" + "% in the class."
        //MARK: Stretch #1
        if result > 100 {
            view.backgroundColor = UIColor.red
            extraCredit.text = "Please see your Teacher about Extra Credit. You're going to need some!"
        } else {
            view.backgroundColor = UIColor.green
            extraCredit.text = ""
        }
    }
    
    @IBAction func indexChanged(_ sender: UISegmentedControl) {
        switch (desiredGradeSegmented.selectedSegmentIndex)
        {
            case 1:
            desiredFinalGradeInput.text = "80"
            break
            case 2:
            desiredFinalGradeInput.text = "70"
            break
            case 3:
            desiredFinalGradeInput.text = "60"
            break
            default:
            desiredFinalGradeInput.text = "90"
            break
            }
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1

    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        desiredFinalGradeInput.text = (pickerData[row])
        
            }
   
        
}

    

