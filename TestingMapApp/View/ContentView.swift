//
//  ContentView.swift
//  TestingMapApp
//
//  Created by Борух Соколов on 24.08.2023.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var vm: ViewModelLocation
    var body: some View {
        
        VStack(){
        ForEach(vm.location, id: \.id) { item in
                Text(item.nameLocation)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewModelLocation())
            
    }
}
