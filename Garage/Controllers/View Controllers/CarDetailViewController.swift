//
//  CarDetailViewController.swift
//  Garage
//
//  Created by Arian Mohajer on 1/19/22.
//

import UIKit

class CarDetailViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    //We may or may not have a car object to work on
    var car: Car? = nil
    
    @IBOutlet weak var makeTextField: UITextField!
    @IBOutlet weak var modelTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var carTypePicker: UIPickerView!
    var pickerData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        //If we have a car, let's update the UI using that instance
        self.carTypePicker.delegate = self
        self.carTypePicker.dataSource = self
        pickerData = ["None", "Sedan", "Truck", "Coupe"]
        
        guard let car = car else {return}
        updateUI(car: car)
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        4
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        //Grabbing text from the text fields so that we can set properties with them
        guard let make = makeTextField.text, !make.isEmpty,
              let model = modelTextField.text, !model.isEmpty,
              let yearString = yearTextField.text, !yearString.isEmpty,
              let year = Int(yearString)
        else {return}
        
        //the car exists, we're updating it
        if let car = car {
            
            var carType = VehicleType.none
            switch carTypePicker.selectedRow(inComponent: 0) {
                case 0: carType = .none
                case 1: carType = .sedan
                case 2: carType = .truck
                case 3: carType = .coupe
                default: carType = .none
            }
            
            CarController.sharedInstance.updateCar(car: car, make: make, model: model, year: year, defaultImage: carType)
        }
        // the car doesn't exist, let's make a new one with the details
        else {
            var carType = VehicleType.none
            switch carTypePicker.selectedRow(inComponent: 0) {
                case 0: carType = .none
                case 1: carType = .sedan
                case 2: carType = .truck
                case 3: carType = .coupe
                default: carType = .none
            }
            CarController.sharedInstance.createCar(make: make, model: model, year: year, defaultImage: carType)
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        makeTextField.text = ""
        modelTextField.text = ""
        yearTextField.text = ""
    }
    
    @IBAction func deleteButtonTapped(_ sender: Any) {
        if let car = car {
            CarController.sharedInstance.deleteCar(car: car)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func updateUI(car: Car) {
        makeTextField.text = car.make
        modelTextField.text = car.model
        yearTextField.text = "\(car.year)"
        var type = 0
        switch car.defaultImage {
        case .none:
            type = 0
        case .sedan:
            type = 1
        case .truck:
            type = 2
        case .coupe:
            type = 3
        }
        carTypePicker.selectRow(type, inComponent: 0, animated: true)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
