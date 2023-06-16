//
//  LoginPage.swift
//  EcommerceAppKit
//
//  Created by Xenia on 12.06.2023.
//

import SwiftUI

class LoginPageModel: ObservableObject {
    // Логин
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showPassword: Bool = false
    
    // Регистрация
    @Published var registerUser: Bool = false
    @Published var re_Enter_Password: String = ""
    @Published var showReEnterPassword: Bool = false

    // Log Status
    @AppStorage("log_Status") var log_Status: Bool = false


    // Login Call
    func Login() {
        withAnimation{
            log_Status = true
        }
    }
    
    func Register() {
        withAnimation{
            log_Status = true
        }
    }
    
    func ForgotPassword() {
        
    }
}

