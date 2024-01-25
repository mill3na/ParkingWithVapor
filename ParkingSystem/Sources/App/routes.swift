import Vapor

func routes(_ app: Application) throws {
    
    var cars = [Car]()
    
    app.get("car") { req async -> [Car] in
        return cars
    }
    
    app.post("car") { req async -> HTTPStatus in
        if let newCar = try? req.content.decode(Car.self) {
            
            if Car.mayEnter(parkedCars: cars, newCar: newCar) {
                cars.append(newCar)
                return .created
                
            } else { return .custom(code: 400, reasonPhrase: "ERROR: License plate already parked!") }
            
        } else {
            return .custom(code: 400, reasonPhrase: "ERROR: Data couldn't be decoded.")
        }
    }
    
    
}
