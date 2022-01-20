//
//  CarDetailViewController.swift
//  Garage
//
//  Created by Arian Mohajer on 1/19/22.
//

import UIKit

class CarDetailViewController: UIViewController {

    //We may or may not have a car object to work on
    var car: Car? = nil
    
    @IBOutlet weak var makeTextField: UITextField!
    @IBOutlet weak var modelTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var carTypePicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //If we have a car, let's update the UI using that instance
        guard let car = car else {return}
        updateUI(car: car)
        
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
            CarController.sharedInstance.updateCar(car: car, make: make, model: model, year: year, defaultImage: .none)
        }
        // the car doesn't exist, let's make a new one with the details
        else {
            CarController.sharedInstance.createCar(make: make, model: model, year: year, defaultImage: .none)
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
