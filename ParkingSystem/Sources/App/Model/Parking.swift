//
//  Parking.swift
//  
//
//  Created by Milena Maia Araújo on 25/01/24.
//

import Foundation
import Vapor

struct Parking: Content {
    var isFull: Bool
    let id: String
    var cars: [Car]
    
    
    mutating func updateParkingStatus() {
        if cars.count > 19 {
            print("ITS FULL. THE QUANTITY OF CARS IS \(self.cars.count)!")
            self.isFull = true
        } else {
            self.isFull = false
        }
    }
}
