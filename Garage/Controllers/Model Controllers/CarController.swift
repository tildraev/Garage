//
//  CarController.swift
//  Garage
//
//  Created by Arian Mohajer on 1/19/22.
//

import Foundation
import UIKit

class CarController {
    static var sharedInstance = CarController()
    var garage = [Car]()
    
    // MARK: - CRUD Functions
    func createCar(make: String, model: String, year: Int, vehicleType: VehicleType, vehicleImage: UIImage) {
        let car = Car(make: make, model: model, year: year, vehicleType: vehicleType, vehicleImage: vehicleImage)
        garage.append(car)
    }
    
    func updateCar(car: Car, make: String, model: String, year: Int, vehicleType: VehicleType, vehicleImage: UIImage) {
        car.make = make
        car.model = model
        car.year = year
        car.vehicleType = vehicleType
        car.vehicleImage = vehicleImage
    }
    
    func deleteCar(car: Car) {
        guard let index = garage.firstIndex(where: {$0 == car}) else {return}
        garage.remove(at: index)
    }
}
