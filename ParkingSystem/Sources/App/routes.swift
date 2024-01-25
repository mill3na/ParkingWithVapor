import Vapor

func routes(_ app: Application) throws {
    
    var cars = [Car]()
    
    var maiaParking = Parking(isFull: false, id: "maia", cars: cars)
    
    app.group("parkingCars") { parkingCars in
        
        parkingCars.get { req async -> [Car] in
            return cars
        }
        
        parkingCars.post { req async -> HTTPStatus in
            if let newCar = try? req.content.decode(Car.self) {
                
                if Car.mayEnter(parkedCars: cars, newCar: newCar) {
                    
                    if !maiaParking.isFull {
                        cars.append(newCar)
                        maiaParking.cars = cars
                        maiaParking.updateParkingStatus()
                        print("\n\n Maia Parking cars: \(maiaParking.cars.count). Parking situation: itsFull - \(maiaParking.isFull)")
                        return .created
                    } else {
                        return .custom(code: 200, reasonPhrase: "ERROR: Parking is full!")
                    }
                    
                    
                } else { return .custom(code: 400, reasonPhrase: "ERROR: License plate already parked!") }
                
            } else {
                return .custom(code: 400, reasonPhrase: "ERROR: Data couldn't be decoded.")
            }
        }
    }
}
