//
//  Car.swift
//
//
//  Created by Milena Maia Araújo on 25/01/24.
//

import Foundation
import Vapor

struct Car: Content {
    
    let licensePlate: String
    let entryTime: String
    let exitTime: String?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.licensePlate = try container.decode(String.self, forKey: .licensePlate)
        self.entryTime = try container.decode(String.self, forKey: .entryTime)
        self.exitTime = try container.decodeIfPresent(String.self, forKey: .exitTime)
    }
    
    static func mayEnter(parkedCars: [Car], newCar: Car) -> Bool {
        for car in parkedCars {
            if car.licensePlate == newCar.licensePlate {
                return false
            } else {
                return true
            }
        }
        return true
    }
    
}
