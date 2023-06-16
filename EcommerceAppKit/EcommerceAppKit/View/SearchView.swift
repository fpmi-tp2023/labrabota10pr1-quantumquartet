//
//  SearchView.swift
//  EcommerceAppKit
//
//  Created by Xenia on 13.06.2023.
//

import SwiftUI

struct SearchView: View {
    var animation: Namespace.ID
    
    @EnvironmentObject var sharedData: SharedDataModel
    
    @EnvironmentObject var homeData: HomeViewModel
    
    @FocusState var startTF: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            // search bar
            HStack(spacing: 20) {
                
                // close btn
                
                Button {
                    withAnimation{
                        homeData.searchActivated = false
                    }
                    homeData.searchText = ""
                    sharedData.fromSearchPage = false
                } label: {
                    Image(systemName: "arrow.left")
                        .font(.title2)
                        .foregroundColor(Color.black.opacity(0.7))
                }
                // search bar
                
                HStack(spacing: 15){
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                        .foregroundColor(.gray)
                    TextField("Search", text: $homeData.searchText)
                        .focused($startTF)
                        .textCase(.lowercase)
                        .disableAutocorrection(true)
                }
                .padding(.vertical, 12)
                .padding(.horizontal)
                .background(
                    Capsule()
                        .strokeBorder(Color.black, lineWidth: 1.5)
                )
                .matchedGeometryEffect(id: "SEARCHBAR", in: animation)
                .padding(.trailing, 20)
            }
            .padding([.horizontal])
            .padding(.top)
            .padding(.bottom, 40)
            
            // Showing progress or not found
            
            if let products = homeData.searchedProducts {
                if products.isEmpty {
                    
                    VStack(spacing: 10) {
                        
//                        Image("NotFound")
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .padding(.top, 60)
//
                        Text("Item Not Found")
                            .font(.custom(customFont, size: 22).bold())
                        
                        Text("Try a more generic search term or try looking for alternative products.")
                            .font(.custom(customFont, size: 16))
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 30)
                    }
                    .padding()
                    
                }else {
                    ScrollView(.vertical, showsIndicators: false){

                        VStack(spacing: 0) {
                            
                            // Found Text
                            Text("Found \(products.count) results")
                                .font(.custom(customFont, size: 24).bold())
                                .padding(.vertical)
                            
                            StaggeredGrid(columns: 2, spacing: 20, list: products) {product in
                                // Card View
                                ProductCardView(product: product)
                            }
                        }
                        .padding(-10)
                    }
                }
                
            } else {
                ProgressView()
                    .padding(.top, 30)
                    .opacity(homeData.searchText == "" ? 0 : 1)
            }
            
           
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(
            Color(.systemGray5).ignoresSafeArea()
        )
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                startTF = true
            }
        }
    }
    
    @ViewBuilder
    func ProductCardView(product: Product)-> some View{
        
        VStack(spacing: 10){
            ZStack {
                if sharedData.showDetailProduct {
                    Image(product.productImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .opacity(0)
                }
                else {
                    Image(product.productImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .matchedGeometryEffect(id: "\(product.id)SEARCH", in: animation)
                }
            }
            .frame(width: getRect().width / 2.5, height: getRect().height / 2.5)
            // sth with image
            .offset(y: -80)
            .padding(.bottom, -50)
            
            
            Text(product.title)
                .font(.custom(customFont, size: 18))
                .fontWeight(.semibold)
                .padding(.top, -80)
            
            Text(product.subtitle)
                .font(.custom(customFont, size: 14))
                .foregroundColor(.gray)
                .padding(.top, -60)
            
            Text(product.price)
                .font(.custom(customFont, size: 16))
                .fontWeight(.bold)
                .foregroundColor(Color(.black))
                .padding(.top, -40)
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 22)
        .background(
            Color.white
                .cornerRadius(25)
        )
        .padding(.top)
        .onTapGesture {
            withAnimation(.easeInOut){
                sharedData.fromSearchPage = true
                sharedData.detailProduct = product
                sharedData.showDetailProduct = true
                
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}
