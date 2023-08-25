//
//  LocationView.swift
//  TestingMapApp
//
//  Created by Борух Соколов on 24.08.2023.
//

import SwiftUI
import MapKit

struct LocationView: View {
    
    @EnvironmentObject var vm: ViewModelLocation
    
    var body: some View {
        
        
        
        ZStack(){
            
            mapLayer
            .ignoresSafeArea()
            
            
            VStack(spacing: 0) {
                header
                    .padding()
                
                
                Spacer()
                
                ZStack{
                    
                    LocationPreviewView(location: vm.mapLocation)
                        
                }
                
                
            }
            
            
            
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
            .environmentObject(ViewModelLocation())
        
    }
}


extension LocationView {
    
    private var header: some View {
        VStack {
            Button(action: vm.toggleLocationsList) {
                Text("\(vm.mapLocation.nameLocation)")
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: vm.showLocationsList ? 180 : 0))
                    }
            }
            
            if vm.showLocationsList {
                LocationsListView()
            }
            
            
            
            
            
            
        }
        
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
    
    
    private var mapLayer: some View {
        Map(coordinateRegion: $vm.mapRegion,
            annotationItems: vm.locations,
            annotationContent: { location in
            MapAnnotation(coordinate: location.coordinates) {
                LocationMapAnnotationView()
                    .scaleEffect(vm.mapLocation == location ? 1 : 0.7)
                    .shadow(radius: 10)
                    .onTapGesture {
                        vm.showNextLocation(location: location)
                    }
            }
        })
    }
    
    
        
}

