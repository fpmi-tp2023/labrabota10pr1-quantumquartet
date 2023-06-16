//
//  LoginView.swift
//  EcommerceAppKit
//
//  Created by Xenia on 14.06.2023.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    @State private var selectedLanguage = "ru" // Изначально выбранный язык (английский)

    let availableLanguages = [
        ("en", NSLocalizedString("english_key", comment: "")),
        ("ru", NSLocalizedString("russian_key", comment: "")),
        ("be-BY", NSLocalizedString("belarusian_key", comment: ""))
    ]
    
    var body: some View {
        
        NavigationStack {
            VStack {
                
                // image
                
                Text(LocalizedStringKey("welcome_back_key"))
                    .font(.custom(customFont, size: 55).bold())
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .frame(height: getRect().height / 3.5)
                    .padding(.vertical, -30)
                    .padding(.horizontal)
                    
                
                // form
                
                VStack(spacing: 24) {
                    InputView(text: $email, title: "Email Adress", placeholder: "ivanov@example.com")
                        .autocapitalization(.none)
                    InputView(text: $password, title: "Password", placeholder: "Enter your password", isSecureField: true)
                }
                .padding(.horizontal)
                
                // sign in btn
                
                Button {
                    Task {
                        try await viewModel.signIn(withEmail: email, password: password)
                    }
                } label: {
                    HStack {
                        Text("SIGN IN")
                            .font(.custom(customFont, size: 16))
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                }
                .background(Color(.blue))
                .disabled(!formValid)
                .opacity(formValid ? 1.0 : 0.5)
                .cornerRadius(10)
                .padding(.top, 24)
                
                Spacer()
                
//                Picker(selection: $selectedLanguage, label: Text(NSLocalizedString("select_language_key", comment: ""))) {
//                    ForEach(availableLanguages, id: \.0) { language in
//                        Text(language.1).tag(language.0)
//                    }
//                }
//                .pickerStyle(.segmented)
//                .padding()
//                .onAppear {
//                    if let selectedLanguage = UserDefaults.standard.array(forKey: "AppleLanguages")?.first as? String {
//                        self.selectedLanguage = selectedLanguage
//                    } else {
//                        self.selectedLanguage = "ru"
//                    }
//                }
//                .onChange(of: selectedLanguage) { newValue in
//                    LocalizationManager.shared.setLanguage(newValue)
//                }
                
                //sign up btn
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 2) {
                        Text("Don't have an account?")
                        Text("Sign up")
                            .fontWeight(.bold)
                            .font(.system(size: 14))
                    }
                }

                
            }
            
        }
    }
}

extension LoginView: AuthenticationFormProtocol {
    var formValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
    }
}
    
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
