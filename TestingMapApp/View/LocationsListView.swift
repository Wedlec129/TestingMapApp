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
            
            VStack(alignment: .leading) {
                Text(location.nameLocation)
                    .font(.headline)
                
                Text("\(location.dataLast)")
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
        }
    }
    
}
