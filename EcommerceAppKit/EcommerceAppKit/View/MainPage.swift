//
//  MainPage.swift
//  EcommerceAppKit
//
//  Created by Xenia on 13.06.2023.
//

import SwiftUI

struct MainPage: View {
    @Namespace var animation
    @State var currentTab: Tab = .Home
    @StateObject  var sharedData: SharedDataModel = SharedDataModel()
    
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        // Tab View
        VStack(spacing: 0){
            TabView(selection: $currentTab){
                Home(animation: animation)
                    .environmentObject(sharedData)
                    .tag(Tab.Home)
                LikedPage()
                    .environmentObject(sharedData)
                    .tag(Tab.Liked)
                ProfileView()
                    .tag(Tab.Profile)
                CartPage()
                    .environmentObject(sharedData)
                    .tag(Tab.Cart)
            }
            
            HStack(spacing: 0){
                ForEach(Tab.allCases, id: \.self){tab in
                    Button{
                        currentTab = tab
                    } label: {
                        Image(tab.rawValue)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 22, height: 22)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(currentTab == tab ? Color(.black) : Color.black.opacity(0.3))
                            .overlay(
                                ZStack{
                                    if currentTab == tab {
                                        Capsule()
                                            .fill(Color(.black))
                                            .matchedGeometryEffect(id: "PRODUCTTAB", in: animation)
                                            .frame(height: 2)
                                    }
                                    else {
                                        Capsule()
                                            .fill(Color(.clear))
                                            .frame(height: 2)
                                    }
                                }
                                .padding(.horizontal, 25)
                                .padding(.vertical, 5)
                                .padding(.bottom, -30)
                                ,alignment: .bottom
                            )
                    }
                }
            }
            .padding([.horizontal, .top])
            .padding(.bottom, 10)
        }
        .background(Color(.systemGray5))
        .overlay(
            ZStack{
                if let product = sharedData.detailProduct, sharedData.showDetailProduct{
                    ProductDetailView(product: product, animation: animation)
                        .environmentObject(sharedData)
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .opacity))
                }
            }
        )
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}

// Tab Cases

enum Tab: String, CaseIterable {
    case Home = "Home"
    case Liked = "Liked"
    case Cart = "Cart"
    case Profile = "Profile"

}
