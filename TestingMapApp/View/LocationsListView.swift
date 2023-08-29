//
//  LocationsListView.swift
//  TestingMapApp
//
//  Created by Борух Соколов on 24.08.2023.
//


import SwiftUI

struct LocationsListView: View {
    
    @EnvironmentObject private var vm: ViewModelLocation
    
    var body: some View {
        List {
            ForEach(vm.locations) { location in
                Button {
                    vm.showNextLocation(location: location)
                } label: {
                    listRowView(location: location)
                }
                .padding(.vertical, 4)
                .listRowBackground(Color.clear)
            }
        }
        .listStyle(PlainListStyle())
    }
}

struct LocationsListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsListView()
            .environmentObject(ViewModelLocation())
    }
}


extension LocationsListView {
    
    private func listRowView(location: ModelLocation) -> some View {
        HStack{
            
                Image(location.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .cornerRadius(10)
            
            VStack(alignment: .leading,spacing: 5) {
                Text(location.nameLocation)
                    .font(.headline)
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
            .frame(maxWidth: .infinity, alignment: .leading)
            
        }
    }
    
}
