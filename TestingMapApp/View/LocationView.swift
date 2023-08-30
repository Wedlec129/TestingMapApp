//
//  LocationView.swift
//  TestingMapApp
//
//  Created by Борух Соколов on 24.08.2023.
//

import SwiftUI
import MapKit
import CoreLocationUI

struct LocationView: View {
    
    @EnvironmentObject var vm: ViewModelLocation
    
    
    @StateObject var viewModel = ContentViewModel()
    
    
    @State var showMe = false
    
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
        ZStack{
            
            Map(coordinateRegion: showMe ? $viewModel.region : $vm.mapRegion,
                showsUserLocation: true,
                annotationItems: vm.locations,
                annotationContent: { location in
                MapAnnotation(coordinate: location.coordinates) {
                    ZStack{



                        LocationMapAnnotationView(location: location)
                            .scaleEffect(vm.mapLocation == location ? 1 : 0.7)
                            .shadow(radius: 10)
                            .onTapGesture {
                                vm.showNextLocation(location: location)
                            }




                    }
                }
            }
            )

            mapButton
            
            LocationButton(.currentLocation){
                viewModel.requestAllowOnceLocationPermission()
                showMe = true
            }
            .foregroundColor(.white)
            .cornerRadius(8)
            .labelStyle(.titleAndIcon)
            .tint(.pink)
            
    
            
            
        }
        
        
        
        
    }
    
    
    private var mapButton: some View {
        
        HStack{
            Spacer()
            VStack{
                Button(action: {
                    vm.size = vm.size - 0.03
                }, label: {
                    Image("ic_zoom_plus")
                        .resizable()
                        .frame(width: 80,height: 80)
                })
                
                Button(action: {
                    vm.size = vm.size + 0.05
                }, label: {
                    Image("ic_zoom_minus")
                        .resizable()
                        .frame(width: 80,height: 80)
                })
                Image("ic_mylocation")
                    .resizable()
                    .frame(width: 80,height: 80)
                
                Button(action: {
                    showMe = false
                    vm.nextButtonPressed()
                }, label: {
                    Image("ic_next_tracker")
                        .resizable()
                        .frame(width: 80,height: 80)
                })
                
            }
        }
    }
    
    
    
}


