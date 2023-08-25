//
//  TestingMapAppApp.swift
//  TestingMapApp
//
//  Created by Борух Соколов on 24.08.2023.
//

import SwiftUI

@main
struct TestingMapAppApp: App {
    
    @StateObject private var vm = ViewModelLocation()
    var body: some Scene {
        WindowGroup {
            LocationView()
                .environmentObject(vm)
                
        }
    }
}
