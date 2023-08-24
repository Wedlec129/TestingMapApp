//
//  ViewModelLocation.swift
//  TestingMapApp
//
//  Created by Борух Соколов on 24.08.2023.
//

import SwiftUI
import MapKit
import Foundation

class ViewModelLocation: ObservableObject {
    
    @Published var location: [ModelLocation] = []
    
    init(){
        fetchLocation()
    }
    
    //типо получаем данные (потом можно парсить json)
    func fetchLocation(){
        location.append(ModelLocation(nameLocation: "Аня", coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922), image: "anna", dataLast: 2, timeLast: 44, volumeSignal: 100))
        
        location.append(ModelLocation(nameLocation: "Давид", coordinates: CLLocationCoordinate2D(latitude: 41.8986, longitude: 12.4769), image: "david", dataLast: 21, timeLast: 14, volumeSignal: 90))
        
    }
    
    
   
   
    
   
    
    
}

