//
//  LocationPreviewView.swift
//  TestingMapApp
//
//  Created by Борух Соколов on 25.08.2023.
//

import SwiftUI
import MapKit

struct LocationPreviewView: View {
    
    @EnvironmentObject private var vm: ViewModelLocation
    let location: ModelLocation
    
    var body: some View {
        
      
            VStack{
                
                Spacer()
                
               
                    titleSection
                    
              
                
                
                
            }
            
        
        
        
        
    }
}

struct LocationPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            
            LocationPreviewView(location: ModelLocation(nameLocation: "Аня", coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922), image: "anna",dataLast: "02.07.2017", timeLast: "14:00", volumeSignal: .good))
                //.padding()
        }
        .environmentObject(ViewModelLocation())
    }
}

extension LocationPreviewView {
    
    
    
    private var titleSection: some View {
        ZStack{
            Color.white
                .ignoresSafeArea()
                .frame(width: .infinity,height: 200)
               
                
            VStack{
                HStack{
                    Image(location.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .cornerRadius(10)
                    
                    
                    VStack(alignment: .leading,spacing: 5) {
                        Text(location.nameLocation)
                            .font(.title2)
                            .fontWeight(.bold)
                        HStack{
                            
                            HStack(spacing: 2){
                                // Image(systemName: "calendar")
                                
                                switch(location.volumeSignal){
                                case .good:
                                    Image(systemName: "wifi")
                                        .foregroundColor(.accentColor)
                                case .norm:
                                    Image(systemName: "wifi.exclamationmark")
                                        .foregroundColor(.accentColor)
                                case .bad:
                                    Image(systemName: "wifi.slash")
                                        .foregroundColor(.accentColor)
                                }
                                Text("GPS ")
                                
                                
                            }
                            
                            
                            HStack{
                                Image(systemName: "calendar")
                                    .foregroundColor(.accentColor)
                                Text("\(location.dataLast)")
                                    .font(.subheadline)
                            }
                            
                            HStack{
                                Image(systemName: "clock")
                                    .foregroundColor(.accentColor)
                                Text("\(location.timeLast)")
                                    .font(.subheadline)
                            }
                            .padding(.horizontal)
                        }
                        
                        
                    }
                   
                }
                HStack{
                   
                    Spacer()
                    showStoris
                    Spacer()
                }
            }
        }
    }
    
    
    
    private var showStoris: some View {
        Button {
            // vm.nextButtonPressed()
        } label: {
            Text("Посмотреть историю")
                .font(.headline)
                .frame(width: .infinity, height: 30)
        }
        .buttonStyle(.borderedProminent)
        
    }
    
}
