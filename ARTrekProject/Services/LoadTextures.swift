//
//  LoadTextures.swift
//  ARTrekProject
//
//  Created by Josh Sorokin on 28/06/2021.
//

import Foundation
import SceneKit
import SceneKit.ModelIO

class LoadTextures: LoadTexturesProtocol {
    func loadTextures(completion: @escaping (MDLMesh) -> ()) {
        guard let url = Bundle.main.url(forResource: "TaxiCar01", withExtension: "obj", subdirectory: "art.scnassets")
        else { fatalError("Failed to find model file.") }
        
        let asset = MDLAsset(url:url)
        guard let object = asset.object(at: 0) as? MDLMesh
        else { fatalError("Failed to get mesh from asset.") }
        
        let scatteringFunction = MDLScatteringFunction()
        let material = MDLMaterial(name: "baseMaterial", scatteringFunction: scatteringFunction)
        let textureFileName = "art.scnassets/TaxiCar_Body_AlbedoTransparency.png"
        material.setTextureProperties([.baseColor: textureFileName])
        
        for submesh in object.submeshes!  {
            if let submesh = submesh as? MDLSubmesh {
                submesh.material = material
            }
        }
        
        completion(object)
    }
}


