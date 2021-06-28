//
//  FloatingPoint+Extension.swift
//  ARTrekProject
//
//  Created by Josh Sorokin on 28/06/2021.
//

import Foundation

extension FloatingPoint {
    func toRadians() -> Self {
        return self * .pi / 180
    }
    
    func toDegrees() -> Self {
        return self * 180 / .pi
    }
}
