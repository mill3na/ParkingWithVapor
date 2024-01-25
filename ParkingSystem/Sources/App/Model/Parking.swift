//
//  Parking.swift
//  
//
//  Created by Milena Maia Araújo on 25/01/24.
//

import Foundation
import Vapor

struct Parking: Content {
    let itsFull: Bool
    let id: String
    let cars: [Car]
    
    
    func itsFull(quantityOfCars: Int) -> Bool {
        return quantityOfCars > 2
        
    }
}
