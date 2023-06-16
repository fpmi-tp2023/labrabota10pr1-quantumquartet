//
//  ContentView.swift
//  EcommerceAppKit
//
//  Created by Xenia on 12.06.2023.
//

import SwiftUI

struct ContentView: View {
//    @AppStorage("log_Status") var log_Status: Bool = true
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                MainPage()
            } else {
                LoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
