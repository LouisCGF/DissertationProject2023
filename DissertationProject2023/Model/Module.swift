//
//  Module.swift
//  DissertationProject2023
//
//  Created by Louis on 13/03/2023.
//

import Foundation
import SwiftUI
import CoreLocation

struct Module: Hashable, Codable, Identifiable {
    
    var id: Int
    var title: String
    var shortDescription: String
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
}
