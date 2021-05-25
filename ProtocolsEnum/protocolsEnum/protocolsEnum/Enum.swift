//
//  Enum.swift
//  protocolsEnum
//
//  Created by Luat on 5/25/21.
//

import Foundation


/**
 Start Here
 1) Have Temperature Enum Adopt the GetFarhenheit protocol
 2) Implement getTempInFarnheit func
 3) Implement tempInFahren property
 -- All test values are int
*/
enum Temperature: GetFarhenheit {
    case fahrenheit(Int)
    case celcius(Int)
    case kelvin(Int)
    var tempInFahren: Int {get { return self.getTempInFahrenheit() }}
    func getTempInFahrenheit() -> Int {
        switch self {
        case .fahrenheit(let temp):
            return temp
        case .celcius(let temp):
            return (temp * 9/5) + 32
        case .kelvin(let temp):
            return (temp - Int(273.15)) * 9/5 + 32
        }
    }
}


protocol GetFarhenheit {
    func getTempInFahrenheit() -> Int
    var tempInFahren: Int { get }
}
