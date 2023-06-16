//
//  LoginPage.swift
//  EcommerceAppKit
//
//  Created by Xenia on 12.06.2023.
//

import SwiftUI

struct LoginPage: View {
    @StateObject var loginData: LoginPageModel = LoginPageModel()
    var body: some View {
        VStack {
            
            Text("Welcome\nback!")
                .font(.custom(customFont, size: 55).bold())
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: getRect().height / 3.5)
                .padding()
                .background(
                    ZStack{
                        LinearGradient(colors: [
                            .cyan,
                            .cyan,
                            .blue
                        ], startPoint: .top, endPoint: .bottom)
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                            .padding(.trailing)
                            .offset(y: -25)
                            .ignoresSafeArea()
                        
                        Circle()
                            .strokeBorder(Color.white.opacity(0.3),lineWidth: 3)
                            .frame(width: 30, height: 30)
                            .blur(radius: 2)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                            .padding(30)
                        
                        Circle()
                            .strokeBorder(Color.white.opacity(0.3),lineWidth: 3)
                            .frame(width: 23, height: 23)
                            .blur(radius: 2)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                            .padding(.leading, 30)
                    }
                )

            ScrollView(.vertical, showsIndicators: false){
                
                // login page form
                VStack(spacing: 15){
                    Text(loginData.registerUser ? "Register" : "Login")
                        .font(.custom(customFont, size: 22).bold())
                        .frame(maxWidth: .infinity, alignment: .leading )
                    
                    // text field
                    CustomTextField(icon: "envelope", title: "Email", hint: "ivanov@gmail.com", value: $loginData.email, showPassword: $loginData.showPassword)
                        .padding(.top, 30)
                    
                    CustomTextField(icon: "lock", title: "Password", hint: "12345678", value: $loginData.password, showPassword: $loginData.showPassword)
                        .padding(.top, 10)
                    
                    // reenter password
                    
                    if loginData.registerUser {
                        CustomTextField(icon: "lock", title: "Re-Enter Password", hint: "12345678", value: $loginData.re_Enter_Password, showPassword: $loginData.showReEnterPassword)
                            .padding(.top, 10)
                    }
                    
                    // forgot password button
                    
                    Button {
                        loginData.ForgotPassword()
                    } label: {
                        Text("Forgot password?")
                            .font(.custom(customFont, size: 14))
                            .fontWeight(.semibold)
                    }
                    .padding(.top, 8)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    // login button
                    
                    Button {
                        if loginData.registerUser {
                            loginData.Register()
                        }
                        else {
                            loginData.Login()
                        }
                    } label: {
                        Text("Login")
                            .font(.custom(customFont, size: 17).bold())
                            .padding(.vertical, 20)
                            .frame(maxWidth: .infinity)
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                            .shadow(color: Color.black.opacity(0.07), radius: 5, x: 5, y: 5)
                    }
                    .padding(.top, 25)
                    .padding(.horizontal)
                    
                    // Register User button
                    
                    
                    Button {
                        withAnimation{
                            loginData.registerUser.toggle()
                        }
                    } label: {
                        Text(loginData.registerUser ? "Back to login" : "Create account")
                            .font(.custom(customFont, size: 14))
                            .fontWeight(.semibold)
                    }
                    .padding(.top, 8)
                }
                .padding(30)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color.white
                    .clipShape(CustomCorners(corners: [.topLeft, .topRight], radius: 25))
                    .ignoresSafeArea()
            )
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.blue)
        
        // Clearing data when changes
        .onChange(of: loginData.registerUser) { newValue in
            loginData.email = ""
            loginData.password = ""
            loginData.re_Enter_Password = ""
            loginData.showPassword = false
            loginData.showReEnterPassword = false
        }
    }
    
    @ViewBuilder
    func CustomTextField(icon: String, title: String, hint: String, value: Binding<String>, showPassword: Binding<Bool>) -> some View {
        VStack(alignment: .leading, spacing: 12){
            Label {
               Text(title)
                    .font(.custom(customFont, size: 14))
            } icon: {
                Image(systemName: icon)
            }
            .foregroundColor(Color.black.opacity(0.8))
            
            if title.contains("Password") && !showPassword.wrappedValue{
                SecureField(hint, text: value)
                    .padding(.top, 2)
            }
            else{
                TextField(hint, text: value)
                    .padding(.top, 2)
            }
            
            Divider()
                .background(Color.black.opacity(0.8))
        }
        
        // showing show button for password
        .overlay(
            Group {
                if title.contains("Password"){
                    Button(action: {
                        showPassword.wrappedValue.toggle()
                    }, label: {
                        Text(showPassword.wrappedValue ? "Hide" : "Show")
                            .font(.custom(customFont, size: 13).bold())
                            .foregroundColor(.blue)
                    })
                    .offset(y: 8)
                }
            }
            ,alignment: .trailing
        )
    }
}




struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
