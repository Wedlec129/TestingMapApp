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
        HStack(alignment: .bottom, spacing: 0) {
            VStack(alignment: .leading, spacing: 16) {
                imageSection
                titleSection
            }
            
            VStack(spacing: 8) {
                nextButton
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y: 65)
        )
        .cornerRadius(10)
    }
}

struct LocationPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            
            LocationPreviewView(location: ModelLocation(nameLocation: "Аня", coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922), image: "anna", dataLast: 2, timeLast: 44, volumeSignal: 100))
                .padding()
        }
        .environmentObject(ViewModelLocation())
    }
}

extension LocationPreviewView {
    
    private var imageSection: some View {
        ZStack {
          
                Image(location.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            
        }
        .padding(6)
        .background(Color.white)
        .cornerRadius(10)
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(location.nameLocation)
                .font(.title2)
                .fontWeight(.bold)
            
            Text("\(location.dataLast)")
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
   
    
    private var nextButton: some View {
        Button {
            vm.nextButtonPressed()
        } label: {
            Text("Next")
                .font(.headline)
                .frame(width: 125, height: 35)
        }
        .buttonStyle(.bordered)
    }
    
}
