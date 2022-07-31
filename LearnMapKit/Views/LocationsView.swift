//
//  LocationsView.swift
//  MAPKIT
//
//  Created by Adarsh Shukla on 31/07/22.
//

import SwiftUI

class LocationsViewModel: ObservableObject {
    @Published var locations: [Location]
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
    }
}

struct LocationsView: View {
    
    @State private var vm = LocationsViewModel()
    
    var body: some View {
        List {
            ForEach(vm.locations) { location in
                Text(location.name)
            }
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
    }
}
