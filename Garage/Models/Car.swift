//
//  Car.swift
//  Garage
//
//  Created by Arian Mohajer on 1/19/22.
//

import Foundation
import UIKit

class Car {
    var make: String
    var model: String
    var year: Int
    var vehicleType: VehicleType
    var vehicleImage: UIImage?
    
    init(make: String, model: String, year: Int, vehicleType: VehicleType, vehicleImage: UIImage?) {
        self.make = make
        self.model = model
        self.year = year
        self.vehicleType = vehicleType
        self.vehicleImage = vehicleImage
    }
}

extension Car: Equatable {
    static func == (lhs: Car, rhs: Car) -> Bool {
        lhs.make == rhs.make &&
        lhs.model == rhs.model &&
        lhs.year == rhs.year &&
        lhs.vehicleType == rhs.vehicleType
    }
}
