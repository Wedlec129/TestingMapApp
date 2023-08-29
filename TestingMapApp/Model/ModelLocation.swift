//
//  ModelLocation.swift
//  TestingMapApp
//
//  Created by Борух Соколов on 24.08.2023.
//

import SwiftUI
import MapKit
import Foundation

struct ModelLocation:Identifiable {
    let id :String = UUID().uuidString
    let nameLocation :String
    let coordinates :CLLocationCoordinate2D
    let image :String
    let dataLast :String
    let timeLast :String
    var volumeSignal:VolumeSignal
    
   // var story
    
    init(nameLocation: String, coordinates: CLLocationCoordinate2D, image: String, dataLast: String, timeLast: String, volumeSignal: VolumeSignal) {
        self.nameLocation = nameLocation
        self.coordinates = coordinates
        self.image = image
        self.dataLast = dataLast
        self.timeLast = timeLast
        self.volumeSignal = volumeSignal
    }
    
    // Equatable
    static func == (lhs: ModelLocation, rhs: ModelLocation) -> Bool {
        lhs.id == rhs.id
    }
}

enum VolumeSignal{
    case bad, norm, good
}


