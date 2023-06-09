//
//  OnBoardingPage.swift
//  EcommerceAppKit
//
//  Created by Xenia on 12.06.2023.
//

import SwiftUI

// to use custom font on all pages
let customFont = "Raleway-Bold"

struct OnBoardingPage: View {
    //showing login
    @State var showLoginPage: Bool = false
    var body: some View {
        VStack(alignment: .center){
            Text("Wire Not ")
                .font(.custom(customFont, size: 55))
                .fontWeight(.bold)
                .foregroundColor(.white)
            Image("OnBoard")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Button {
                withAnimation{
                    showLoginPage = true
                }
            } label: {
                Text("Get started")
                    .font(.custom(customFont, size: 18))
                    .fontWeight(.semibold)
                    .padding(.vertical, 18)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                    .foregroundColor(Color.blue)
            }
            .padding(.horizontal, 30)
            .offset(y: getRect().height < 750 ? 20 : 40)
            Spacer()
        }
        .padding()
        .padding(.top, getRect().height < 750 ? 0 : 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color(.blue)
        )
//        .overlay(
//            Group {
//                if showLoginPage {
////                    LoginPage()
//                        .transition(.move(edge: .bottom))
//                }
//            }
//        )
        
    }
}

struct OnBoardingPage_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingPage()
    }
}

extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}

