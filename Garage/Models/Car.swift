//
//  Car.swift
//  Garage
//
//  Created by Arian Mohajer on 1/19/22.
//

import Foundation

class Car {
    var make: String
    var model: String
    var year: Int
    var defaultImage: VehicleType
    
    init(make: String, model: String, year: Int, defaultImage: VehicleType) {
        self.make = make
        self.model = model
        self.year = year
        self.defaultImage = defaultImage
    }
}

extension Car: Equatable {
    static func == (lhs: Car, rhs: Car) -> Bool {
        lhs.make == rhs.make &&
        lhs.model == rhs.model &&
        lhs.year == rhs.year &&
        lhs.defaultImage == rhs.defaultImage
    }
}
