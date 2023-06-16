//
//  EcommerceAppKitApp.swift
//  EcommerceAppKit
//
//  Created by Xenia on 12.06.2023.
//

import SwiftUI
import Firebase

@main
struct EcommerceAppKitApp: App {
    @StateObject var viewModel = AuthViewModel()
    @StateObject private var vm = LocationsViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
                .environmentObject(vm)
        }
    }
}
