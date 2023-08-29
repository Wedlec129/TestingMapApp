//
//  LocationMapAnnotationView.swift
//  TestingMapApp
//
//  Created by Борух Соколов on 25.08.2023.
//

import SwiftUI
import MapKit

struct LocationMapAnnotationView: View {
    let location: ModelLocation
    var body: some View {
        ZStack{
            ZStack{
                Image("ic_tracker")
                    .frame(width: 20, height: 20)
                    .overlay{
                        Image(location.image)
                            .resizable()
                            .frame(width: 60, height: 60)
                            .scaledToFit()
                            .cornerRadius(100)
                            .offset(y: -10)
                        
                        
                        
                    }
                
                
                RoundedRectangle(cornerRadius: 50)
                    .frame(width: 150,height: 70)
                    .foregroundColor(.white)
                
                    .overlay(content: {
                        VStack(alignment: .leading){
                            
                            
                            Text(location.nameLocation)
                                .font(.title2)
                                .bold()
                            HStack{
                                Text("GPS, \(location.timeLast)")
                                
                            }
                            
                            
                        }
                    })
                    .offset(x: 90,y:50)
                
                
                
                
            }
            
        }
        
    }
}

struct LocationMapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationMapAnnotationView(location: ModelLocation(nameLocation: "Аня", coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922), image: "anna", dataLast: "02.07.2017", timeLast: "14:00", volumeSignal: .good))
    }
}
