//
//  GetLocationDataProtocol.swift
//  ARTrekProject
//
//  Created by Josh Sorokin on 28/06/2021.
//

import Foundation

protocol GetLocationDataProtocol {
    
    func getLocationData(completion: @escaping (Location) -> ())
    
}
