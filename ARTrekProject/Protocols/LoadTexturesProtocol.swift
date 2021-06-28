//
//  LoadTexturesProtocol.swift
//  ARTrekProject
//
//  Created by Josh Sorokin on 28/06/2021.
//

import Foundation
import SceneKit
import SceneKit.ModelIO

protocol LoadTexturesProtocol {
    
    func loadTextures(completion: @escaping (MDLMesh) -> ())
    
}
