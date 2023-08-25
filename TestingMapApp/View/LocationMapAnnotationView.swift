//
//  LocationMapAnnotationView.swift
//  TestingMapApp
//
//  Created by Борух Соколов on 25.08.2023.
//

import SwiftUI

struct LocationMapAnnotationView: View {
    var body: some View {
        Image("ic_tracker")
            .frame(width: 20, height: 20)
    }
}

struct LocationMapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationMapAnnotationView()
    }
}
