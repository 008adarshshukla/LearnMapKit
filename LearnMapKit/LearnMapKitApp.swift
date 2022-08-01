//
//  LearnMapKitApp.swift
//  LearnMapKit
//
//  Created by Adarsh Shukla on 31/07/22.
//

import SwiftUI

@main
struct LearnMapKitApp: App {
    @StateObject private var vm = LocationsViewModel()
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
